import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gods_love/constants.dart';

class CustomerImage extends StatelessWidget {
  const CustomerImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: SvgPicture.asset('assets/icons/person.svg'),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: aBgColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
    );
  }
}
