import 'package:flutter/material.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/components/container_with_stack_name.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/components/measurement_details.dart';

import '../../../../../constants.dart';

class Measurements extends StatelessWidget {
  final TextEditingController? back;
  final TextEditingController? sleeve;
  final TextEditingController? lenght;
  final TextEditingController? neck;
  final TextEditingController? open;

  const Measurements({
    Key? key,
    this.back,
    this.sleeve,
    this.lenght,
    this.neck,
    this.open,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWithStackName(
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
            MeasurementDetails(
              back: back,
              sleeve: sleeve,
              lenght: lenght,
              neck: neck,
              open: open,
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Add trouser',
                style: TextStyle(
                  color: aPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
