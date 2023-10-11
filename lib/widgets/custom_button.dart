import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color backGroundColor;
  final VoidCallback onPress;

  CustomButton(
      {required this.title,
      required this.backGroundColor,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: backGroundColor,
        height: 50,
        width: 150,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
