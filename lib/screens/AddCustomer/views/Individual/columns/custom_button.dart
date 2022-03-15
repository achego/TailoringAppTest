import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Color color;
  final Function() onPressed;
  final double? width;
  final Color textcolor;

  const CustomButton({
    Key? key,
    required this.name,
    required this.onPressed,
    this.width,
    this.color = aPrimaryColor,
    this.textcolor = aLightTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: textcolor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
