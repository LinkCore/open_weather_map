import 'package:flutter/material.dart';
import '../../../common/app_text_styles.dart';
import '../../../domain/blocs/weather_bloc/weather_bloc.dart';

class WeatherCartDescriptionSection extends StatefulWidget {
  final WeatherHasDataState state;
  final String textTitle;
  final String textSubtitle;

  const WeatherCartDescriptionSection(
      {Key? key,
      required this.state,
      required this.textTitle,
      required this.textSubtitle})
      : super(key: key);

  @override
  WeatherCartDescriptionSectionState createState() =>
      WeatherCartDescriptionSectionState();
}

class WeatherCartDescriptionSectionState
    extends State<WeatherCartDescriptionSection> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(widget.textTitle,
          style: AppTextStyles.descriptionCartTitleTextStyle),
      const SizedBox(height: 10),
      Text(
          '${widget.state.weather.wind!.speed.toString()} ${widget.textSubtitle}',
          style: AppTextStyles.descriptionCartSubtitleTextStyle)
    ]);
  }
}