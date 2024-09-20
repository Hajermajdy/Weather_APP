import 'package:flutter/material.dart';
import 'package:weather_app/constant/color.dart';
import 'package:weather_app/search_screen/search_screen.dart';

class ButtonSearch extends StatelessWidget {
  const ButtonSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(),
            ));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorSelect.srarchColor,
                blurRadius: 3,
                blurStyle: BlurStyle.outer)
          ],
          border: Border.all(
            color: ColorSelect.srarchColor,
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(9),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: ColorSelect.srarchColor,
              size: 19,
            ),
            Text(
              "Search ..",
              style: TextStyle(
                color: ColorSelect.srarchColor,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
