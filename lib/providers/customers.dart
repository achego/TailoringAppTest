import 'package:flutter/cupertino.dart';
import 'package:gods_love/models/cloth.dart';
import 'package:gods_love/models/measurements.dart';

class Customer {
  final String id;
  final String name;
  final String photo;
  final String phone;

  Customer({
    required this.id,
    required this.name,
    this.photo = '',
    this.phone = '',
  });
}

class Customers with ChangeNotifier {
  final List<Customer> _customers = [
    Customer(
      id: DateTime.now().toString(),
      name: 'Chief Fubara',
      phone: '0011',
    ),
    Customer(
      id: DateTime.now().toString(),
      name: 'Pastor Victor',
      phone: '0803489223',
    ),
  ];

  final List<Cloth> _clothes = [
    Cloth(
      customerName: 'Chief Fubara',
      price: 10000,
      advance: 5000,
      clothType: 'Jumper',
      collectionDate: DateTime.now(),
      relatedDate: DateTime.now(),
      measurement: Measurement(
        back: 10,
        sleeve: 23,
        lenght: 22,
        neck: 17,
        open: 50,
      ),
    ),
    Cloth(
      customerName: 'Chief Fubara',
      price: 10000,
      advance: 5000,
      clothType: 'Don',
      collectionDate: DateTime.parse('2020-03-07'),
      relatedDate: DateTime.now(),
      measurement: Measurement(
        back: 1,
        sleeve: 27,
        lenght: 22,
        neck: 17,
        open: 50,
      ),
    ),
    Cloth(
      customerName: 'Pastor Victor',
      price: 20000,
      advance: 3000,
      clothType: 'Worko',
      collectionDate: DateTime.parse('2018-04-09'),
      relatedDate: DateTime.now(),
      measurement: Measurement(
        back: 2,
        sleeve: 23,
        lenght: 25,
        neck: 17,
        open: 50,
      ),
    )
  ];
  List<Cloth> _searchedClothes = [];

  final List<String> _acceptedClothes = [
    'Etibo',
    'Jumper',
    'Senator',
    'Don',
  ];

  final Map<String, DateTime> dates = {};

  bool _searched = false;

  String searchBy = 'Name';

  List<Customer> get customers {
    return [..._customers];
  }

  List<Cloth> get allClothes {
    if (_searchedClothes.isEmpty & !_searched) {
      _searchedClothes = _clothes;
    }
    return [..._searchedClothes];
  }

  List<String> get acceptedClothes {
    return [..._acceptedClothes];
  }

  Measurement currentMeasurement(String customerName) {
    return _clothes
        .firstWhere((cloth) => cloth.customerName == customerName)
        .measurement;
  }

  double balance(index) {
    return allClothes[index].price - allClothes[index].advance;
  }

  void addDate(DateTime date, String type) {
    dates.addAll({type: date});
  }

  void clearDates() {
    dates.clear();
  }

  void addCustomer({
    required String name,
    required String customerName,
    String phone = 'none',
    required double price,
    required double advance,
    required DateTime collectionDate,
    required DateTime relatedDate,
    String clothType = 'none',
    required double back,
    required double sleeve,
    required double lenght,
    required double neck,
    required double open,
  }) {
    _customers.add(
      Customer(
        id: DateTime.now().toString(),
        name: name,
        phone: phone,
      ),
    );
    _clothes.add(
      Cloth(
        customerName: customerName,
        price: price,
        advance: advance,
        clothType: clothType,
        collectionDate: collectionDate,
        relatedDate: relatedDate,
        measurement: Measurement(
          back: back,
          sleeve: sleeve,
          lenght: lenght,
          neck: neck,
          open: open,
        ),
      ),
    );
    notifyListeners();
  }

  Customer getCustomer(String customerName) {
    Customer customer = Customer(id: 'id', name: 'name');
    for (var cus in _customers) {
      if (cus.name == customerName) {
        customer = cus;
      } else {}
    }
    return customer;
  }

  String searchWord = '';
  void searchCustomerBy(String argument) {
    _searched = true;
    searchWord = argument;
    argument = argument.toLowerCase();

    if (argument.isEmpty) {
      _searchedClothes = _clothes;
      notifyListeners();
      return;
    }

    switch (searchBy) {
      case 'Name':
        searchByName(argument);
        break;
      case 'RelatedDate':
        searchByRelatedDate(argument);
        break;
      case 'CollectionDate':
        searchByCollectionDate(argument);
        break;
      case 'Measurement':
        searchByMeasurement(argument);
        break;
      default:
    }
    notifyListeners();
  }

  void searchStatus(String argument) {
    searchBy = argument;
    notifyListeners();
  }

  void searchByName(String argument) {
    List<Cloth> clothes = [];
    for (var cloth in _clothes) {
      if (cloth.customerName.toLowerCase().contains(argument)) {
        clothes.add(cloth);
      }
    }
    _searchedClothes = clothes;
  }

  void searchByRelatedDate(String argument) {
    List<Cloth> clothes = [];
    for (var cloth in _clothes) {
      if (cloth.relatedDate.toString().startsWith(argument)) {
        clothes.add(cloth);
      }
    }
    _searchedClothes = clothes;
  }

  void searchByCollectionDate(String argument) {
    List<Cloth> clothes = [];
    for (var cloth in _clothes) {
      if (cloth.collectionDate.toString().startsWith(argument)) {
        clothes.add(cloth);
      }
    }
    _searchedClothes = clothes;
  }

  void searchByMeasurement(String argument) {
    List<String> measurement = argument.split(' ');
    List<String> mName = ['B', 'S', 'L', 'N', 'O'];
    Map<String, double?> mBody = {};

    List<Cloth> clothes = [];

    for (var i = 0; i < measurement.length; i++) {
      mBody.addAll({mName[i]: double.tryParse(measurement[i])});
    }

    for (var cloth in _clothes) {
      switch (measurement.length) {
        case 1:
          print('1');
          if (cloth.measurement.back == mBody['B']) {
            clothes.add(cloth);
          }
          break;
        case 2:
          print('2');
          print(cloth.measurement.sleeve);
          print(mBody['S']);
          if (cloth.measurement.back == mBody['B'] &&
              cloth.measurement.sleeve == mBody['S']) {
            clothes.add(cloth);
          }
          break;
        case 3:
          print('3');
          if (cloth.measurement.back == mBody['B'] &&
              cloth.measurement.sleeve == mBody['S'] &&
              cloth.measurement.lenght == mBody['L']) {
            clothes.add(cloth);
          }
          break;
        case 1:
          if (cloth.measurement.lenght == mBody['B']) {
            clothes.add(cloth);
          }
          break;
        default:
      }
    }

    _searchedClothes = clothes;
  }
}
