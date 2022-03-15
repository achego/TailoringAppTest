import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gods_love/constants.dart';
import 'package:gods_love/screens/home/home.dart';

class Splash extends StatefulWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _navigateToHome(context, 3);
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: double.infinity,
        child: Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/background.png',
                fit: BoxFit.fitWidth,
                // width: double.infinity,
              ),
              Column(children: [
                SizedBox(height: size.height * 0.35),
                SvgPicture.asset('assets/icons/logo.svg'),
                // Image.asset(
                //   'assets/images/logo.png',
                //   fit: BoxFit.contain,
                // ),
                SizedBox(height: size.height * 0.28),
                const Text(
                  aCaption,
                  style: TextStyle(
                    fontSize: 22,
                    color: aBgColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  aSubcation,
                  style: TextStyle(
                    fontSize: 22,
                    color: aBgColor,
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context, int secs) {
    // Future.delayed(
    //   Duration(seconds: secs),
    //   () => Navigator.pushReplacementNamed(context, Home.routeName),
    // );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // TODO: implement initState
    super.initState();
  }
}
