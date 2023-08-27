import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_text.dart';
import '../../../domain/blocs/weather_bloc/weather_bloc.dart';
import 'weather_cart_description_section.dart';

class WeatherCartDescription extends StatefulWidget {
  final WeatherHasDataState state;

  const WeatherCartDescription({Key? key, required this.state})
      : super(key: key);

  @override
  WeatherCartDescriptionState createState() => WeatherCartDescriptionState();
}

class WeatherCartDescriptionState extends State<WeatherCartDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints( maxWidth: 200, minHeight: 170),
        width: MediaQuery.of(context).size.width / 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.whiteTextColor),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          WeatherCartDescriptionSection(
              textSubtitle: AppText.mS,
              textTitle: AppText.wind,
              state: widget.state),
          WeatherCartDescriptionSection(
              textSubtitle: AppText.percent,
              textTitle: AppText.humidity,
              state: widget.state),
          WeatherCartDescriptionSection(
              textSubtitle: AppText.km,
              textTitle: AppText.visibility,
              state: widget.state)
        ]));
  }
}