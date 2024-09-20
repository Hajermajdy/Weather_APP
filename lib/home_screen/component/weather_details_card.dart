import 'package:flutter/material.dart';
import 'package:weather_app/constant/color.dart';

class WeatherDetails extends StatelessWidget {
  final String text;
  final double num;
  final double font1;
  final double font2;
  const WeatherDetails({
    super.key,
    required this.text,
    required this.num,
    required this.font1,
    required this.font2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: ColorSelect.whiteColor,
            fontSize: font1,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          num.ceil().toString(),
          style: TextStyle(
            color: ColorSelect.whiteColor,
            fontSize: font2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
