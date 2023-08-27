import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/app_theme.dart';
import 'domain/blocs/theme_bloc/theme_bloc.dart';
import 'domain/blocs/weather_bloc/weather_bloc.dart';
import 'domain/blocs/weather_forecast_bloc/weather_forecast_bloc.dart';
import 'home_view.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  ThemeData themeColor = AppTheme.clearSkyTheme;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ThemeBloc()..add(ThemeStartupEvent())),
          BlocProvider(
              create: (context) => WeatherBloc()..add(WeatherStartupEvent())),
          BlocProvider(
              create: (context) =>
                  WeatherForecastBloc()..add(WeatherForecastStartupEvent())),
        ],
        child: BlocListener<ThemeBloc, ThemeState>(
            listener: (context, state) {
              if (state is ThemeHasDataState) {
                setState(() {
                  themeColor = state.currentTheme;
                });
              }
            },
            child: MaterialApp(
                scrollBehavior: const MaterialScrollBehavior().copyWith(
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                    PointerDeviceKind.stylus,
                    PointerDeviceKind.unknown
                  },
                ),
                theme: themeColor,
                debugShowCheckedModeBanner: false,
                home: HomeView(themeColor: themeColor))));
  }
}
