import 'package:flutter/material.dart';
import 'package:gods_love/models/cloth.dart';

import 'package:gods_love/providers/customers.dart';
import 'package:gods_love/screens/CustomerDetails/customer_details.dart';

import 'package:gods_love/screens/home/home.dart';

import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final path = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(path.path);
  // Hive.registerAdapter(CustomerAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Customers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AGL',
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ThemeData().colorScheme.copyWith(
                secondary: aAccentColor,
                primary: aPrimaryColor,
              ),
          primaryColor: aPrimaryColor,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black),
            color: aBgColor,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        home: const Home(),
        routes: {
          Home.routeName: (_) => const Home(),
          CustomerDetails.routeName: (_) => CustomerDetails(),
        },
      ),
    );
  }
}
