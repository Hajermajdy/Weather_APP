import 'package:flutter/material.dart';
import 'package:weather_app/constant/color.dart';
import 'package:weather_app/constant/image_paths.dart';
import 'package:weather_app/spalsh_screen/draggable_button.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath().welcomeScreen),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(ImagePath().iconWelcomeScreen),
                const Text(
                  "cloudwatch",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Nerko_One",
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
                    style: TextStyle(
                      color: ColorSelect.whiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      // fontFamily: "Nerko_One",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            
            const SizedBox(
              width: 220,
              child: DraggableButton(),
            ),
          ],
        ),
      ),
    );
  }
}
