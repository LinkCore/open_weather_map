import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_text.dart';
import '../../../common/app_text_styles.dart';
import '../../../domain/blocs/weather_bloc/weather_bloc.dart';

class WeatherCartMain extends StatefulWidget {
  final WeatherHasDataState state;

  const WeatherCartMain({Key? key, required this.state}) : super(key: key);

  @override
  WeatherCartMainState createState() => WeatherCartMainState();
}

class WeatherCartMainState extends State<WeatherCartMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.5,
        constraints: const BoxConstraints(maxWidth: 600, minWidth: 370, minHeight: 170),
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: AppColors.blackTextColor.withOpacity(0.3),
                  offset: const Offset(-2, 2),
                  blurRadius: 2)
            ]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Image.network(widget.state.weather.iconUrl,
                    width: 115, height: 115),
                Container(
                    // width: MediaQuery.of(context).size.width / 3.5,
                    margin: const EdgeInsets.only(left: 5),
                    child: Text(
                        widget.state.weather.weather!.first.description
                            .toString(),
                        style: AppTextStyles
                            .weatherCartMainDescriptionTextStyle)),
              ]),
Spacer(),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${widget.state.weather.main!.temp.toString()}°',
                    style: AppTextStyles.weatherCartMainTempTextStyle),
                Text(
                    '${AppText.feelsLike} ${widget.state.weather.main!.feelsLike.toString()}°',
                    style: AppTextStyles.weatherCartMainFeelsLikeTextStyle)
              ])
            ]));
  }
}
