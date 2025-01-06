import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition,
                  ),
                ),
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.amber;
    case "Partly cloudy":
      return Colors.indigo;
    case "Cloudy":
    case "Overcast":
      return Colors.brown;
    case "Mist":
    case "Fog":
      return Colors.blueGrey;
    case "Freezing fog":
      return Colors.teal;
    case "Patchy rain possible":
    case "Patchy light drizzle":
    case "Light drizzle":
      return Colors.lightBlue;
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
      return Colors.cyan;
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
      return Colors.blue;
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
      return Colors.deepPurple;
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.deepOrange;
    case "Patchy snow possible":
    case "Light snow":
    case "Patchy light snow":
    case "Patchy moderate snow":
      return Colors.cyan;
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
      return Colors.lightBlue;
    case "Blizzard":
    case "Blowing snow":
    case "Light snow showers":
      return Colors.blueGrey;
    case "Moderate or heavy snow showers":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.purple;
    case "Ice pellets":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.teal;
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.pink;
    default:
      return Colors.blue;
  }
}
