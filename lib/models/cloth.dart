import 'package:gods_love/models/measurements.dart';

class Cloth {
  final String customerName;
  final String imageUrl;
  final String clothType;
  final DateTime collectionDate;
  final DateTime relatedDate;
  final bool pending;
  final double price;
  final double advance;
  final Measurement measurement;

  Cloth({
    required this.customerName,
    this.imageUrl = '',
    required this.measurement,
    required this.price,
    required this.advance,
    required this.clothType,
    required this.collectionDate,
    required this.relatedDate,
    this.pending = false,
  });
}
