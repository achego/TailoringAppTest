import 'package:flutter/material.dart';

import '../constants.dart';

class CustomBottomnavbarItem extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final bool active;
  const CustomBottomnavbarItem({
    Key? key,
    required this.icon,
    this.onTap = print,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: active ? aPrimaryColor : null,
          borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        onPressed: () => onTap,
        icon: Icon(
          icon,
          color: active ? aLightTextColor : aPrimaryColor,
        ),
      ),
    );
  }
}

class CustomButtomNavBar extends StatelessWidget {
  final List<CustomBottomnavbarItem> items;

  const CustomButtomNavBar({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: aLightTextColor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: items),
    );
  }
}
