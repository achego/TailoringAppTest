import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gods_love/screens/CustomerDetails/navigations/pending/navigations/etibo.dart';
import 'package:gods_love/screens/CustomerDetails/navigations/pending/navigations/jumper.dart';
import 'package:gods_love/screens/CustomerDetails/navigations/pending/navigations/senator.dart';
import 'package:gods_love/screens/CustomerDetails/navigations/pending/navigations/don.dart';

import '../../../../constants.dart';

class DetailsPending extends StatelessWidget {
  const DetailsPending({Key? key}) : super(key: key);

  final _tabs = const [
    Tab(text: 'Etibo'),
    Tab(text: 'Jumper'),
    Tab(text: 'Don'),
    Tab(text: 'Senator'),
  ];
  final _views = const [Etibo(), Jumper(), Don(), Senator()];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _tabs.length,
      child: Column(
        children: [
          Container(
            height: size.height * 0.38,
            width: double.infinity,
            decoration: BoxDecoration(
              color: aBgColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1.5),
                  blurRadius: 0.2,
                  color: Colors.grey.withOpacity(0.7),
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/person.svg',
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
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
