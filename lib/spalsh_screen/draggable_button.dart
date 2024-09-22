import 'package:flutter/material.dart';
import 'package:weather_app/constant/color.dart';
import 'package:weather_app/home_screen/home_screen.dart';

class DraggableButton extends StatefulWidget {
  const DraggableButton({super.key});

  @override
  State<DraggableButton> createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  double dragPosition = 15.0;
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          dragPosition += details.delta.dx;
          dragPosition = dragPosition.clamp(0.0, screenWidth - 170);
          isDragging = true;
        });
      },
      onHorizontalDragEnd: (details) {
        if (dragPosition >= screenWidth - 170) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        } else {
          setState(() {
            dragPosition = 15.0;
            isDragging = false;
          });
        }
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorSelect.whiteColor,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(19)),
            ),
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: isDragging ? 0 : 1,
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Swipe to Learn More",
                    style: TextStyle(
                      color: ColorSelect.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      // fontFamily: "Nerko_One",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 13,
            left: dragPosition,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorSelect.whiteColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
