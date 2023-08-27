import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../data/models/weather_forecast.dart';
import '../../../data/service/geolocation_service.dart';
import '../../../data/service/weather_forecast_service.dart';

part 'weather_forecast_event.dart';
part 'weather_forecast_state.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  WeatherForecastBloc() : super(WeatherForecastInitial()) {
    on<WeatherForecastStartupEvent>(_onWeatherForecastStartupEvent);
    on<WeatherForecastCityEvent>(_onWeatherForecastCityEvent);
  }

  Future<void> _onWeatherForecastStartupEvent(WeatherForecastStartupEvent event,
      Emitter<WeatherForecastState> emit) async {
    emit(WeatherForecastLoadingState());
    try {
      Position geoLocation = await GeolocationProvider().determinePosition();
      final WeatherForecast weatherForecast = await WeatherForecastService()
          .getWeatherForecast(
          geoLocation.latitude.toString(), geoLocation.longitude.toString());
      emit(WeatherForecastHasDataState(weatherForecast: weatherForecast));
    } on Exception catch (e) {
      WeatherForecastErrorState(errorCode: e.toString());
    }
  }

  Future<void> _onWeatherForecastCityEvent(WeatherForecastCityEvent event,
      Emitter<WeatherForecastState> emit) async {
    emit(WeatherForecastLoadingState());
    try {
      final WeatherForecast weatherForecastByCity =
          await WeatherForecastService().getWeatherForecastByCity(event.city);

      emit(WeatherForecastHasDataState(weatherForecast: weatherForecastByCity));
    } on Exception catch (e) {
      emit(WeatherForecastErrorState(errorCode: e.toString()));
    }
  }
}