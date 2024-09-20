import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/constant/color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: ColorSelect.whiteColor,
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: ColorSelect.DarkBlue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 50),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              style: TextStyle(color: ColorSelect.srarchColor),
              cursorHeight: 16,
              cursorColor: ColorSelect.srarchColor,
              cursorWidth: 1,
              onSubmitted: (value) async {
                // trigger cubit
                BlocProvider.of<GetWeatherCubit>(context)
                    .getWeather(cityname: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(9),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(9),
                  ),
                  borderSide: BorderSide(color: ColorSelect.DarkBlue),
                ),
                hintText: "Enter City name",
                hintStyle: TextStyle(
                  color: ColorSelect.srarchColor,
                  fontSize: 12,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorSelect.srarchColor,
                ),
                labelText: 'Search for a City ',
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: ColorSelect.srarchColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
