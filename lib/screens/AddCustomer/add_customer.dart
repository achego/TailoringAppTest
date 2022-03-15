import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gods_love/constants.dart';
import 'package:gods_love/screens/AddCustomer/views/Group/group.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/individual.dart';

class AddCustomer extends StatelessWidget {
  AddCustomer({Key? key}) : super(key: key);

  final _tabs = const [Tab(text: 'Individual'), Tab(text: 'Group')];
  final _views = [Individual(), Group()];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _tabs.length,
      child: Column(
        children: [
          const SizedBox(height: 7),
          Container(
            height: 3.4,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              color: aAccentColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 7),
          TabBar(
            indicatorWeight: 3,
            indicatorColor: aAccentColor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: _tabs,
            labelColor: adarkTextColor,
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(child: TabBarView(children: _views)),
        ],
      ),
    );
  }
}
