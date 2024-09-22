import 'package:flutter/widgets.dart';
import 'package:weather_app/constant/color.dart';
import 'package:weather_app/constant/image_paths.dart';

class ErrorWeatherView extends StatelessWidget {
  const ErrorWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Image.asset(
            ImagePath().errorImage,
          ),
          Text(
            "Not Found :)",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
              color: ColorSelect.DarkBlue,
            ),
          )
        ],
      ),
    );
  }
}
