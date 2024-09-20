import 'package:flutter/material.dart';
import 'package:weather_app/constant/color.dart';

class TimeDate extends StatelessWidget {
  const TimeDate({super.key,required this.txt});

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Text(txt.toString(),
      style:
          TextStyle(color: ColorSelect.whiteColor, fontWeight: FontWeight.w800),
    );
  }
}
