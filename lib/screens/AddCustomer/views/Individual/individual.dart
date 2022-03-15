import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:gods_love/constants.dart';
import 'package:gods_love/providers/customers.dart';
import 'package:provider/provider.dart';
import 'columns/custom_button.dart';
import 'columns/amount.dart';
import 'columns/customer_image.dart';
import 'package:gods_love/screens/home/widgets/search_box.dart';

import 'columns/date.dart';
import 'columns/measurements.dart';

class Individual extends StatelessWidget {
  Individual({Key? key}) : super(key: key);

  final TextEditingController _customerName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _back = TextEditingController();
  final TextEditingController _sleeve = TextEditingController();
  final TextEditingController _length = TextEditingController();
  final TextEditingController _neck = TextEditingController();
  final TextEditingController _open = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _advance = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(aDefaultPadding),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          const CustomerImage(),
          const SizedBox(height: 20),
          SearchBox(
            hintText: 'customer name',
            controller: _customerName,
          ),
          const SizedBox(height: 10),
          SearchBox(
            hintText: 'phone number',
            controller: _phoneNumber,
          ),
          const SizedBox(height: 10),
          const Text(
            'Cloth type: ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Measurements(
            back: _back,
            sleeve: _sleeve,
            lenght: _length,
            neck: _neck,
            open: _open,
          ),
          const SizedBox(height: 25),
          Amount(
            size: size,
            price: _price,
            advance: _advance,
          ),
          const SizedBox(height: 25),
          Date(size: size),
          const SizedBox(height: aDefaultPadding * 1.3),
          CustomButton(
            name: 'Add Cutomer',
            onPressed: () {
              final dates =
                  Provider.of<Customers>(context, listen: false).dates;

              Provider.of<Customers>(context, listen: false).addCustomer(
                name: _customerName.text,
                customerName: _customerName.text,
                phone: _phoneNumber.text,
                price: double.parse(_price.text),
                advance: double.parse(_advance.text),
                collectionDate: dates['col']!,
                relatedDate: dates['rel']!,
                back: double.parse(_back.text),
                sleeve: double.parse(_sleeve.text),
                lenght: double.parse(_length.text),
                neck: double.parse(_neck.text),
                open: double.parse(_open.text),
              );

              Provider.of<Customers>(context, listen: false).clearDates();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
