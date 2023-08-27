import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {

//clear
  static ThemeData clearSkyTheme = ThemeData(scaffoldBackgroundColor: AppColors.clearSkyColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.clearSkyColor));

//clouds
  static ThemeData fewCloudsTheme = ThemeData(scaffoldBackgroundColor: AppColors.fewCloudsColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.fewCloudsColor));
  static ThemeData scatteredCloudsTheme = ThemeData(scaffoldBackgroundColor: AppColors.scatteredCloudsColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.scatteredCloudsColor));
  static ThemeData brokenCloudsTheme = ThemeData(scaffoldBackgroundColor: AppColors.brokenCloudsColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.brokenCloudsColor));
  static ThemeData overcastCloudsTheme = ThemeData(scaffoldBackgroundColor: AppColors.overcastCloudsColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.overcastCloudsColor));

//thunderstorm
  static ThemeData thunderstormTheme = ThemeData(scaffoldBackgroundColor: AppColors.thunderstormColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.thunderstormColor));
  static ThemeData lightThunderstormTheme = ThemeData(scaffoldBackgroundColor: AppColors.lightThunderstormColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.lightThunderstormColor));
  static ThemeData heavyThunderstormTheme = ThemeData(scaffoldBackgroundColor: AppColors.heavyThunderstormColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.heavyThunderstormColor));

//drizzle
  static ThemeData drizzleTheme = ThemeData(scaffoldBackgroundColor: AppColors.drizzleColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.drizzleColor));
  static ThemeData lightDrizzleTheme = ThemeData(scaffoldBackgroundColor: AppColors.lightDrizzleColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.lightDrizzleColor));
  static ThemeData heavyDrizzleTheme = ThemeData(scaffoldBackgroundColor: AppColors.heaveDrizzleColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.heaveDrizzleColor));

//rain
  static ThemeData rainTheme = ThemeData(scaffoldBackgroundColor: AppColors.rainColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.rainColor));
  static ThemeData lightRainTheme = ThemeData(scaffoldBackgroundColor: AppColors.lightRainColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.lightRainColor));
  static ThemeData heavyRainTheme = ThemeData(scaffoldBackgroundColor: AppColors.heavyRainColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary:  AppColors.heavyRainColor));

//snow
  static ThemeData lightSnowTheme = ThemeData(scaffoldBackgroundColor: AppColors.lightSnowColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.lightSnowColor));
  static ThemeData heavySnowTheme = ThemeData(scaffoldBackgroundColor: AppColors.heavySnowColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.heavySnowColor));
  static ThemeData snowTheme = ThemeData(scaffoldBackgroundColor: AppColors.snowColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.snowColor));

//mist
  static ThemeData hazeTheme = ThemeData(scaffoldBackgroundColor: AppColors.hazeColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.hazeColor));
  static ThemeData mistTheme = ThemeData(scaffoldBackgroundColor: AppColors.mistColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.mistColor));
  static ThemeData fogTheme = ThemeData(scaffoldBackgroundColor: AppColors.fogColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.fogColor));

//sand
  static ThemeData dustTheme = ThemeData(scaffoldBackgroundColor: AppColors.dustColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.dustColor));
  static ThemeData sandTheme = ThemeData(scaffoldBackgroundColor: AppColors.sandColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.sandColor));
  static ThemeData sandAndDustWhirlsTheme = ThemeData(scaffoldBackgroundColor: AppColors.sandAndDustWhirlsColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.sandAndDustWhirlsColor));

//smoke
  static ThemeData smokeTheme = ThemeData(scaffoldBackgroundColor: AppColors.smokeColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.smokeColor));
  static ThemeData squallsTheme = ThemeData(scaffoldBackgroundColor: AppColors.squallsColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.squallsColor));
  static ThemeData tornadoTheme = ThemeData(scaffoldBackgroundColor: AppColors.tornadoColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.tornadoColor));
  static ThemeData volcanicAshTheme = ThemeData(scaffoldBackgroundColor: AppColors.volcanicAshColor, textTheme: TextTheme(bodyMedium: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.volcanicAshColor));
}