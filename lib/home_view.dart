import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/app_colors.dart';
import 'common/app_text.dart';
import 'common/app_text_styles.dart';
import 'domain/blocs/theme_bloc/theme_bloc.dart';
import 'domain/blocs/weather_bloc/weather_bloc.dart';
import 'domain/blocs/weather_forecast_bloc/weather_forecast_bloc.dart';
import 'presentation/weather_has_data/weather_has_data_view.dart';
import 'presentation/widgets/animated_app_bar.dart';
import 'presentation/widgets/weather_error_widget.dart';
import 'presentation/widgets/weather_loading_widget.dart';

class HomeView extends StatefulWidget {
  final ThemeData themeColor;

  const HomeView({Key? key, required this.themeColor}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final _cityTextController = TextEditingController();
  String country = '';
  String cityName = '';

  Future<ui.Image> loadImage() async {
    final imageBytes = await rootBundle.load('assets/images/example.jpg');
    return decodeImageFromList(imageBytes.buffer.asUint8List());
  }

  Future<void> _onGeolocationWeather() async {
    context.read<ThemeBloc>().add(ThemeStartupEvent());
    context.read<WeatherBloc>().add(WeatherStartupEvent());
    context.read<WeatherForecastBloc>().add(WeatherForecastStartupEvent());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
        future: loadImage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                body: Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).textTheme.bodyMedium!.color)));
          } else {
            final image = snapshot.data!;
            return ShaderMask(
                shaderCallback: (Rect bounds) => ImageShader(
                    image,
                    TileMode.mirror,
                    TileMode.mirror,
                    Matrix4.identity().storage),
                child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          AnimatedAppBar(
                              cityTextController: _cityTextController,
                              themeColor: widget.themeColor,
                              cityName: cityName,
                              country: country),
                          BlocConsumer<WeatherBloc, WeatherState>(
                              listener: (context, state) {
                            if (state is WeatherHasDataState) {
                              setState(() {
                                country = state.weather.sys!.country.toString();
                                cityName = state.weather.name.toString();
                              });
                            }
                          }, builder: (context, state) {
                            if (state is WeatherLoadingState) {
                              return const WeatherLoadingWidget();
                            } else if (state is WeatherHasDataState) {
                              return WeatherHasDataView(
                                  state: state,
                                  cityTextController: _cityTextController.text);
                            } else if (state is WeatherErrorState) {
                              return WeatherErrorWidget(state: state);
                            } else {
                              return Text(AppText.errorState,
                                  style: AppTextStyles.appBarCityNameTextStyle);
                            }
                          })
                        ]),
                    floatingActionButton: Padding(
                        padding: const EdgeInsets.only(bottom: 30, right: 5),
                        child: InkWell(
                            onTap: _onGeolocationWeather,
                            child: const Icon(Icons.location_searching,
                                size: 32, color: AppColors.blackTextColor)))));
          }
        });
  }
}