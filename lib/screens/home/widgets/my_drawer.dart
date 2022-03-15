import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            color: aPrimaryColor,
          )
        ],
      ),
    );
  }
}
