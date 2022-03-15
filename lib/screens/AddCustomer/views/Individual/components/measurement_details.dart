import 'package:flutter/material.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/components/container_with_stack_name.dart';

class MeasurementDetails extends StatelessWidget {
  final TextEditingController? back;
  final TextEditingController? sleeve;
  final TextEditingController? lenght;
  final TextEditingController? neck;
  final TextEditingController? open;
  const MeasurementDetails({
    Key? key,
    this.back,
    this.sleeve,
    this.lenght,
    this.neck,
    this.open,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContainerWithStackName(
          top: -15,
          left: 16,
          name: Text(
            'B',
            style: TextStyle(fontSize: 19),
          ),
          height: 50,
          width: 50,
          child: TextField(
            controller: back,
            keyboardType: TextInputType.number,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration.collapsed(hintText: ''),
          ),
        ),
        ContainerWithStackName(
          top: -15,
          left: 16,
          name: Text(
            'S',
            style: TextStyle(fontSize: 19),
          ),
          height: 50,
          width: 50,
          child: TextField(
            keyboardType: TextInputType.number,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration.collapsed(hintText: ''),
            controller: sleeve,
          ),
        ),
        ContainerWithStackName(
          top: -15,
          left: 16,
          name: Text(
            'L',
            style: TextStyle(fontSize: 19),
          ),
          height: 50,
          width: 50,
          child: TextField(
            controller: lenght,
            keyboardType: TextInputType.number,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration.collapsed(hintText: ''),
          ),
        ),
        ContainerWithStackName(
          top: -15,
          left: 16,
          name: Text(
            'N',
            style: TextStyle(fontSize: 19),
          ),
          height: 50,
          width: 50,
          child: TextField(
            controller: neck,
            keyboardType: TextInputType.number,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration.collapsed(hintText: ''),
          ),
        ),
        ContainerWithStackName(
          top: -15,
          left: 16,
          name: Text(
            'O',
            style: TextStyle(fontSize: 19),
          ),
          height: 50,
          width: 50,
          child: TextField(
            controller: open,
            keyboardType: TextInputType.number,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration.collapsed(hintText: ''),
          ),
        ),
      ],
    );
  }
}
