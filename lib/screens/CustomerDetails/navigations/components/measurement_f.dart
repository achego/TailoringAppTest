import 'package:flutter/material.dart';
import 'package:gods_love/constants.dart';
import 'package:gods_love/models/measurements.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/components/container_with_stack_name.dart';

class Measure extends StatelessWidget {
  final Measurement measurement;

  const Measure({
    Key? key,
    required this.measurement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContainerWithStackName(
          top: -15,
          left: 16,
          name: const Text(
            'B',
            style: TextStyle(fontSize: 19),
          ),
          height: 50,
          width: 50,
          child: Text(
            measurement.back.toStringAsFixed(0),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: aPrimaryColor),
          ),
        ),
        ContainerWithStackName(
          top: -15,
          left: 16,
          name: const Text(
            'S',
            style: TextStyle(fontSize: 19),
          ),
          height: 50,
          width: 50,
          child: Text(
            measurement.sleeve.toStringAsFixed(0),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: aPrimaryColor),
          ),
        ),
        ContainerWithStackName(
          top: -15,
          left: 16,
          name: const Text(
            'L',
            style: TextStyle(fontSize: 19),
          ),
          height: 50,
          width: 50,
          child: Text(
            measurement.lenght.toStringAsFixed(0),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: aPrimaryColor),
          ),
        ),
        ContainerWithStackName(
          top: -15,
          left: 16,
          name: const Text(
            'N',
            style: TextStyle(fontSize: 19),
          ),
          height: 50,
          width: 50,
          child: Text(
            measurement.neck.toStringAsFixed(0),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: aPrimaryColor),
          ),
        ),
        ContainerWithStackName(
          top: -15,
          left: 16,
          name: const Text(
            'O',
            style: TextStyle(fontSize: 19),
          ),
          height: 50,
          width: 50,
          child: Text(
            measurement.open.toStringAsFixed(0),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: aPrimaryColor),
          ),
        ),
      ],
    );
  }
}
