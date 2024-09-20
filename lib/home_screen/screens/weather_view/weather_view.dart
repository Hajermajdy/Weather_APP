import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/constant/image_paths.dart';
import 'package:weather_app/home_screen/component/location_bar.dart';
import 'package:weather_app/home_screen/component/weather_card.dart';
import 'package:weather_app/home_screen/component/weather_details_view.dart';
import 'package:weather_app/models/weather_app_model.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherAppModel? weatherAppData =
        BlocProvider.of<GetWeatherCubit>(context).weatherAppModel;
    return Column(
      children: [
        const LocationBar(),
        const SizedBox(
          height: 10,
        ),
        const WeatherDetailsView(),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WeatherCard(
              degree: weatherAppData?.humidity ?? 0,
              imagePath: ImagePath().humidityIcon,
              txt: "Humidity",
            ),
            WeatherCard(
              degree: weatherAppData?.windkph ?? 0.0,
              imagePath: ImagePath().windIcon,
              txt: "Wind",
            ),
          ],
        )
      ],
    );
  }
}
