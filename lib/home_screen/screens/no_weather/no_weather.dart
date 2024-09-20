import 'package:flutter/material.dart';
import 'package:weather_app/constant/color.dart';
import 'package:weather_app/constant/image_paths.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Image.asset(ImagePath().searchImage),
          Text(
            "Please enter the name of the city to view the weather...",
            style: TextStyle(
              color: ColorSelect.DarkBlue,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
