import 'package:flutter/material.dart';
import 'package:weather_app/constant/color.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({
    super.key,
    required this.degree,
    required this.imagePath,
    required this.txt,
  });

  final String imagePath;
  final String txt;
   var degree;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: ColorSelect.DarkBlue,
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 50,
            height: 60,
          ),
          Text(
            txt,
            style: TextStyle(
              color: ColorSelect.whiteColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
           degree.toString(),
            style: TextStyle(
              color: ColorSelect.whiteColor,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
