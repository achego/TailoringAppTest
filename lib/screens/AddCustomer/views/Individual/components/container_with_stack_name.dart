import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class ContainerWithStackName extends StatelessWidget {
  final double? height;
  final double? width;
  final Text name;
  final double thickness;
  final double top;
  final double left;
  final double radius;
  final Widget child;
  final Color color;

  const ContainerWithStackName({
    Key? key,
    this.height,
    this.width,
    required this.name,
    this.thickness = 1,
    this.top = 0,
    this.left = 0,
    this.child = const Text(''),
    this.radius = 10,
    this.color = adarkTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              width: thickness,
              color: color,
            ),
          ),
          child: child,
        ),
        Positioned(
          left: left,
          top: top,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 3,
              vertical: 0,
            ),
            color: aBgColor,
            child: name,
          ),
        )
      ],
    );
  }
}
