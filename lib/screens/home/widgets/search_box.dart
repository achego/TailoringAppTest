import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchBox extends StatelessWidget {
  final Color boxColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final double hintSize;
  final double? height;
  final double? width;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const SearchBox({
    Key? key,
    this.boxColor = aPrimaryColor,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText = '',
    this.hintSize = 15,
    this.height,
    this.width,
    this.keyboardType,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: boxColor,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          prefixIcon == null
              ? const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                )
              : prefixIcon!,
          Expanded(
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: hintSize),
              ),
            ),
          ),
          suffixIcon == null
              ? const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                )
              : suffixIcon!,
        ],
      ),
    );
  }
}
