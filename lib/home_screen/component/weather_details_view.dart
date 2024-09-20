import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/constant/color.dart';
import 'package:weather_app/constant/image_paths.dart';
import 'package:weather_app/constant/key_word.dart';
import 'package:weather_app/constant/list_of_key_word.dart';
import 'package:weather_app/home_screen/component/date_time.dart';
import 'package:weather_app/home_screen/component/weather_details_card.dart';
import 'package:weather_app/models/weather_app_model.dart';

class WeatherDetailsView extends StatefulWidget {
  const WeatherDetailsView({super.key});

  @override
  State<WeatherDetailsView> createState() => _WeatherDetailsViewState();
}

class _WeatherDetailsViewState extends State<WeatherDetailsView>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  Timer? _timer;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController for smooth fade transitions
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this, //the SingleTickerProviderStateMixin
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the timer to change images every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      setState(() {
        _currentIndex =
            (_currentIndex + 1) % ListOfKeyWords().sunnyimageState.length;
      });
      _controller.forward(from: 0.0); // Start the fade animation from 0
    });

    _controller.forward(); // Initially show the first image with fade-in
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    _controller.dispose(); // Dispose of the AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String image = ImagePath().loadingImage;
    WeatherAppModel? weatherAppData =
        BlocProvider.of<GetWeatherCubit>(context).weatherAppModel;
    // conditions of Weather State
    if (weatherAppData?.weatherState == "Sunny") {
      image = ListOfKeyWords().sunnyimageState[_currentIndex];
    } else if (weatherAppData?.weatherState == "Clear") {
      image = ListOfKeyWords().clearimageState[_currentIndex];
    } else if (KeyWord()
        .mistConditions
        .contains(weatherAppData?.weatherState)) {
      image = ListOfKeyWords().mistimageState[_currentIndex];
    } else if (KeyWord()
        .snowConditions
        .contains(weatherAppData?.weatherState)) {
      image = ListOfKeyWords().snowimageState[_currentIndex];
    } else if (KeyWord()
        .rainConditions
        .contains(weatherAppData?.weatherState)) {
      image = ListOfKeyWords().rainimageState[_currentIndex];
    }
    // end conditions
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        height: 320,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 185, 165, 165).withOpacity(0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (weatherAppData?.averageTemp ?? 0.0).toString(),
                        style: TextStyle(
                          color: ColorSelect.whiteColor,
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                      Text(
                        weatherAppData?.weatherState ?? "",
                        style: TextStyle(
                          color: ColorSelect.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          TimeDate(
                            txt: ((DateTime.parse(weatherAppData?.localTime ??
                                        "0000-00-00 00:00")
                                    .day)
                                .toString()),
                          ),
                          const Text(" "),
                          TimeDate(
                            txt: DateFormat("MMM")
                                .format(DateTime.parse(
                                    weatherAppData?.localTime ??
                                        "0000-00-00 00:00"))
                                .toString(),
                          ),
                          const Text(" "),
                          TimeDate(
                            txt: (DateTime.parse(weatherAppData?.localTime ??
                                        "0000-00-00 00:00")
                                    .year)
                                .toString(),
                          ),
                          Text(
                            ",  ",
                            style: TextStyle(
                                color: ColorSelect.whiteColor,
                                fontWeight: FontWeight.w800),
                          ),
                          TimeDate(
                            txt: (DateTime.parse(weatherAppData?.localTime ??
                                        "0000-00-00 00:00")
                                    .hour)
                                .toString(),
                          ),
                          Text(
                            ":",
                            style: TextStyle(
                                color: ColorSelect.whiteColor,
                                fontWeight: FontWeight.w800),
                          ),
                          TimeDate(
                            txt: (DateTime.parse(weatherAppData?.localTime ??
                                        "0000-00-00 00:00")
                                    .minute)
                                .toString(),
                          ),
                        ],
                      ),
                      Row(
                        children: [],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WeatherDetails(
                        text: "Max Temp : ",
                        num: weatherAppData?.maxTemp ?? 0.0,
                        font1: 16,
                        font2: 16,
                      ),
                      WeatherDetails(
                        text: "Min Temp : ",
                        num: weatherAppData?.minTemp ?? 0.0,
                        font1: 16,
                        font2: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
