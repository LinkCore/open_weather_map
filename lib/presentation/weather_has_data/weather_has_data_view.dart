import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/app_colors.dart';
import '../../common/app_text.dart';
import '../../domain/blocs/theme_bloc/theme_bloc.dart';
import '../../domain/blocs/weather_bloc/weather_bloc.dart';
import '../../domain/blocs/weather_forecast_bloc/weather_forecast_bloc.dart';
import 'widgets/weather_cart_description.dart';
import 'widgets/weather_cart_main.dart';
import 'widgets/weather_forecast.dart';

class WeatherHasDataView extends StatefulWidget {
  final WeatherHasDataState state;
  final String cityTextController;

  const WeatherHasDataView(
      {Key? key, required this.state, required this.cityTextController})
      : super(key: key);

  @override
  State<WeatherHasDataView> createState() => _WeatherHasDataViewState();
}

class _WeatherHasDataViewState extends State<WeatherHasDataView> {
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 425));
    if (widget.cityTextController.isEmpty) {
      context.read<ThemeBloc>().add(ThemeStartupEvent());
      context.read<WeatherBloc>().add(WeatherStartupEvent());
      context.read<WeatherForecastBloc>().add(WeatherForecastStartupEvent());
      FocusManager.instance.primaryFocus?.unfocus();
    } else {
      context
          .read<ThemeBloc>()
          .add(ThemeCityEvent(city: widget.cityTextController));
      context
          .read<WeatherBloc>()
          .add(WeatherCityEvent(city: widget.cityTextController));
      context
          .read<WeatherForecastBloc>()
          .add(WeatherForecastCityEvent(city: widget.cityTextController));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: RefreshIndicator(
            onRefresh: _onRefresh,
            color: Theme.of(context).scaffoldBackgroundColor,
            backgroundColor: AppColors.whiteTextColor,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Row(
                      children: [
                        WeatherCartMain(state: widget.state),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 60, minWidth: 10),
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        WeatherCartDescription(state: widget.state),
                      ],
                    ),
                ),
              ),
              BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
                  builder: (context, state) {
                if (state is WeatherForecastLoadingState) {
                  return const SizedBox();
                } else if (state is WeatherForecastHasDataState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 850),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: state.weatherForecast.forecast!
                                  .map((e) => WeatherForecastWidget(e: e))
                                  .toList())),
                    ),
                  );
                } else if (state is WeatherForecastErrorState) {
                  return Text(state.errorCode);
                } else {
                  return Text(AppText.error);
                }
              })
            ])));
  }
}
