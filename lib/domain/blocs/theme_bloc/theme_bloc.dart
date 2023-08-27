import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../common/app_utilities.dart';
import '../../../data/models/weather_model.dart';
import '../../../data/service/geolocation_service.dart';
import '../../../data/service/weather_service.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeStartupEvent>(_onThemeOnStartupEvent);
    on<ThemeCityEvent>(_onThemeCityEvent);
  }

  Future<void> _onThemeOnStartupEvent(
      ThemeStartupEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeLoadingState());
    Position geoLocation = await GeolocationProvider().determinePosition();
    final WeatherNow weather = await WeatherService().getWeatherNow(
        geoLocation.latitude.toString(), geoLocation.longitude.toString());

    String description = weather.weather!.first.description.toString();

    if (AppUtilities.mapStringToTheme.containsKey(description)) {
      emit(AppUtilities.mapStringToTheme[description]!);
    } else {
      emit(ThemeErrorState(errorCode: e.toString()));
    }
  }

  Future<void> _onThemeCityEvent(
      ThemeCityEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeLoadingState());
    try {
      final WeatherNow weatherByCity =
          await WeatherService().getWeatherByCity(event.city);
      String description = weatherByCity.weather!.first.description.toString();

      if (AppUtilities.mapStringToTheme.containsKey(description)) {
        emit(AppUtilities.mapStringToTheme[description]!);
      } else {
        emit(ThemeErrorState(errorCode: e.toString()));
      }
    } on Exception catch (e) {
      emit(ThemeErrorState(errorCode: e.toString()));
    }
  }
}