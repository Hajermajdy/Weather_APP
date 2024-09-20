import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/constant/color.dart';
import 'package:weather_app/home_screen/screens/error_weather_view/error_weather_view.dart';
import 'package:weather_app/home_screen/component/button_search.dart';
import 'package:weather_app/home_screen/screens/weather_view/weather_view.dart';
import 'package:weather_app/home_screen/screens/no_weather/no_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Around Country",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: ColorSelect.DarkBlue,
            fontFamily: "Nerko_One",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ButtonSearch(),
            // integrate cubit 
            BlocBuilder<GetWeatherCubit, WeatherAppState>(
              builder: (context, state) {
                if (state is Noweather) {
                  return const NoWeather();
                } else if (state is WeatherSuccessfully) {
                  return const WeatherView();
                } else if (state is Weatherloading) {
                  return const Skeletonizer(
                    child: WeatherView(),
                  );
                } else {
                  return const ErrorWeatherView();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
