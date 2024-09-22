import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/constant/color.dart';
import 'package:weather_app/models/weather_app_model.dart';

class LocationBar extends StatelessWidget {
  const LocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherAppModel? weatherAppData =
        BlocProvider.of<GetWeatherCubit>(context).weatherAppModel;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: ColorSelect.DarkBlue,
            size: 18,
          ),
          Text(
            weatherAppData?.city?? "",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: ColorSelect.DarkBlue,
              // fontFamily: "Nerko_One",
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            child: Text(" - "),
          ),
          Text(
            weatherAppData?.county ?? "",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: ColorSelect.DarkBlue,
              // fontFamily: "Nerko_One",
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
