import 'package:flutter/material.dart';
import 'package:gods_love/helper.dart';
import 'package:gods_love/providers/customers.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/components/container_with_stack_name.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';

class Date extends StatefulWidget {
  final String? relatedDate;
  final String? collectionDate;
  Date({
    Key? key,
    required this.size,
    this.relatedDate,
    this.collectionDate,
  }) : super(key: key);

  final Size size;

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  String _relatedDate = 'Today';
  DateTime _relInit = DateTime.now();
  DateTime _colInit = DateTime.now();
  String _collectionDate = 'Choose Date';

  @override
  Widget build(BuildContext context) {
    return ContainerWithStackName(
      name: const Text('Date: '),
      color: aPrimaryColor,
      top: -13,
      left: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: aDefaultPadding,
          vertical: aDefaultPadding * 0.7,
        ),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Related date: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: widget.size.width * 0.3,
                  child: GestureDetector(
                    onTap: () => _showDatePicker(context, 'rel'),
                    child: TextFormField(
                      readOnly: true,
                      enabled: false,
                      decoration: InputDecoration.collapsed(
                        hintText: _relatedDate,
                        hintStyle: const TextStyle(
                          color: aPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: const TextStyle(color: aPrimaryColor),
                    ),
                  ),
                ),
                SizedBox(width: widget.size.width * 0.15),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Collection date: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: widget.size.width * 0.3,
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: () => _showDatePicker(context, 'col'),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration.collapsed(
                          hintText: _collectionDate,
                          hintStyle: const TextStyle(
                            color: aPrimaryColor,
                            fontSize: 15,
                          )),
                      style: const TextStyle(color: aPrimaryColor),
                    ),
                  ),
                ),
                SizedBox(width: widget.size.width * 0.15),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showDatePicker(BuildContext context, String type) {
    String initialDate = '';
    showDatePicker(
            context: context,
            initialDate: type == 'rel' ? _relInit : _colInit,
            firstDate: DateTime(2002),
            lastDate: DateTime(2030))
        .then((value) {
      if (type == 'col') {
        Provider.of<Customers>(context, listen: false).addDate(value!, type);
        setState(() {
          _collectionDate = formatDate(value);
          _colInit = value;
        });
      } else {
        Provider.of<Customers>(context, listen: false).addDate(value!, type);
        setState(() {
          if (value.toString().substring(0, 10) ==
              DateTime.now().toString().substring(0, 10)) {
            _relatedDate = 'Today';

            return;
          }
          _relatedDate = formatDate(value);
          _relInit = value;
        });
      }
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
