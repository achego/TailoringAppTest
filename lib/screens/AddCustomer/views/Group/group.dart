import 'package:flutter/material.dart';

import 'package:gods_love/screens/AddCustomer/views/Individual/columns/amount.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/columns/custom_button.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/columns/customer_image.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/columns/date.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/columns/measurements.dart';
import 'package:gods_love/screens/home/widgets/search_box.dart';

import '../../../../constants.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(aDefaultPadding),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          Stack(children: const [
            CustomerImage(),
            Positioned(
              top: 10,
              left: 10,
              child: CircleAvatar(
                backgroundColor: aPrimaryColor,
                child: Text('2'),
              ),
            )
          ]),
          const SizedBox(height: 20),
          const SearchBox(hintText: 'customer name'),
          const SizedBox(height: 10),
          const SearchBox(hintText: 'phone number'),
          const SizedBox(height: 10),
          const Text(
            'Cloth type: ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          const Measurements(),
          const SizedBox(height: 25),
          Amount(size: size),
          const SizedBox(height: 25),
          Date(size: size),
          const SizedBox(height: aDefaultPadding * 1.3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: CustomButton(
                  name: 'Finish',
                  onPressed: () {},
                ),
              ),
              Expanded(
                flex: 2,
                child: CustomButton(
                  textcolor: aPrimaryColor,
                  color: Colors.transparent,
                  name: 'Add',
                  onPressed: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
