import 'package:flutter/material.dart';
import 'package:gods_love/constants.dart';
import 'package:gods_love/providers/customers.dart';

import 'package:gods_love/screens/home/widgets/customer_item.dart';
import 'package:provider/provider.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customers = Provider.of<Customers>(context);
    final clothes = customers.allClothes;
    return ListView.builder(
      itemCount: customers.allClothes.length,
      itemBuilder: (ctx, i) => CustomerItem(
        balance: customers.balance(i),
        clothType: clothes[i].clothType,
        collectionDate: clothes[i].collectionDate,
        customerName: clothes[i].customerName,
      ),
    );
  }
}
