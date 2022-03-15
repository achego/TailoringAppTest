import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gods_love/constants.dart';
import 'package:gods_love/models/measurements.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/components/container_with_stack_name.dart';
import 'package:gods_love/screens/CustomerDetails/navigations/components/measurement_f.dart';

class DetailsHome extends StatelessWidget {
  final String phone;
  final Measurement measurement;
  final String imageUrl;

  const DetailsHome(
      {Key? key,
      this.phone = 'None',
      required this.measurement,
      this.imageUrl = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: size.height * 0.48,
              padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                color: aPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Text(
                phone,
                style: const TextStyle(
                  color: aLightTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
            Container(
              height: size.height * 0.38,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: aBgColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/person.svg',
                    height: 170,
                  ),
                ],
              ),
            )
          ],
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(aDefaultPadding),
            child: ListView(
              children: [
                const Text(
                  'Current Measurement:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                ContainerWithStackName(
                  top: -15,
                  left: 10,
                  name: const Text('Measurements: '),
                  color: aPrimaryColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: aDefaultPadding,
                      vertical: aDefaultPadding * 0.7,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 7),
                        Measure(measurement: measurement),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Show trouser',
                            style: TextStyle(
                              color: aPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
