import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gods_love/constants.dart';
import 'package:gods_love/screens/AddCustomer/add_customer.dart';
import 'columns/customer_list.dart';
import 'columns/search_bar.dart';
import 'widgets/my_drawer.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: aPrimaryColor,
        statusBarBrightness: Brightness.light,
      ),
    );

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: aDefaultPadding,
              horizontal: aDefaultPadding,
            ),
            child: SearchBar(),
          ),
          SizedBox(height: aDefaultPadding * 0.12),
          Expanded(child: CustomerList()),
        ],
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () => _showAddNewCustomer(context, size),
        child: SvgPicture.asset(
          'assets/icons/plusIcon.svg',
          height: 24,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(aDefaultPadding),
          child: InkWell(
            onTap: () {
              print('tapped bell');
            },
            child: SvgPicture.asset(
              'assets/icons/bell.svg',
              height: 20,
            ),
          ),
        ),
      ],
    );
  }

  _showAddNewCustomer(BuildContext context, Size size) {
    final height = size.height * 0.88;
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: height,
        minWidth: double.infinity,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (ctx) => AddCustomer(),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
