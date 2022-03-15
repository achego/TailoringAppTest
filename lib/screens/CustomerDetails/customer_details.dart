import 'package:flutter/material.dart';
import 'package:gods_love/constants.dart';
import 'package:gods_love/models/measurements.dart';
import 'package:gods_love/providers/customers.dart';
import 'package:provider/provider.dart';
import 'navigations/home.dart';
import 'navigations/amount.dart';
import 'navigations/pending/pending.dart';
import 'navigations/list.dart';

class CustomerDetails extends StatefulWidget {
  static const routeName = '/customer_details';

  const CustomerDetails({Key? key}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.pending),
      label: 'Pending',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'List',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.monetization_on),
      label: 'Money',
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final String customerName =
        ModalRoute.of(context)!.settings.arguments as String;

    final Customer customer = Provider.of<Customers>(context, listen: false)
        .getCustomer(customerName);
    final String phone = customer.phone;
    final Measurement currentMeasurement =
        Provider.of<Customers>(context, listen: false)
            .currentMeasurement(customerName);

    List<Widget> _views = [
      DetailsHome(
        measurement: currentMeasurement,
        phone: phone,
      ),
      DetailsPending(),
      DetailsList(),
      DetailsAmount()
    ];

    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   title: Text(
          //     DUMMY_CUSTOMERS[0].name,
          //     style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 20,
          //     ),
          //   ),
          // ),
          body: Column(children: [
            Container(
              height: 54,
              color: aBgColor,
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 50),
                      child: Text(
                        customerName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _views[_selectedIndex],
            ),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            currentIndex: _selectedIndex,
            items: _items,
            type: BottomNavigationBarType.fixed,
            elevation: 2,
          )),
    );
  }
}
