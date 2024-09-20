import 'package:flutter/widgets.dart';
import 'package:weather_app/constant/image_paths.dart';

class ErrorWeatherView extends StatelessWidget {
  const ErrorWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Image.asset(
        ImagePath().errorImage,
      ),
    );
  }
}
