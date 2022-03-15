import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gods_love/helper.dart';

import 'package:gods_love/screens/CustomerDetails/customer_details.dart';

import '../../../constants.dart';

class CustomerItem extends StatelessWidget {
  final String customerName;
  final String clothType;
  final DateTime collectionDate;
  final double balance;
  const CustomerItem({
    Key? key,
    required this.customerName,
    required this.clothType,
    required this.collectionDate,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 102,
          margin: const EdgeInsets.symmetric(
            vertical: aDefaultPadding * 0.4,
            horizontal: aDefaultPadding,
          ),
          decoration: _decorateModel(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(flex: 3, child: MaterialImage()),
              const SizedBox(width: 0),
              Expanded(
                  flex: 10,
                  child: NameAndOtherInfo(
                    balance: balance,
                    clothType: clothType,
                    collectionDate: formatDate(collectionDate),
                    customerName: customerName,
                  )),
            ],
          ),
        ),
        // if (cusData.customers[i].clothes)
        //   Positioned(
        //     top: 3,
        //     right: aDefaultPadding + 5,
        //     child: Container(
        //       height: 17,
        //       width: 17,
        //       decoration: BoxDecoration(
        //           color: aPendingColor,
        //           borderRadius: BorderRadius.circular(10),
        //           boxShadow: const [
        //             BoxShadow(
        //               color: Colors.black45,
        //               blurRadius: 2,
        //               offset: Offset(0, 2),
        //             ),
        //           ]),
        //     ),
        //   ),
      ],
    );
  }
}

BoxDecoration _decorateModel() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: aBgColor,
    boxShadow: const [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 4,
        offset: Offset(0, 1),
      ),
    ],
  );
}

class NameAndOtherInfo extends StatelessWidget {
  final String customerName;
  final String clothType;
  final String collectionDate;
  final double balance;
  const NameAndOtherInfo({
    Key? key,
    required this.customerName,
    required this.clothType,
    required this.collectionDate,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        CustomerDetails.routeName,
        arguments: customerName,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
              ),
              color: aPrimaryColor.withOpacity(0.65),
            ),
            child: Text(
              customerName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: aLightTextColor,
              ),
            ),
          ),
          Text(
            clothType,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: adarkTextColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Collection:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Balance:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: aDefaultPadding),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      collectionDate,
                      style: const TextStyle(
                        fontSize: 15,
                        color: aPrimaryColor,
                      ),
                    ),
                    Row(children: [
                      SvgPicture.asset('assets/icons/ngnIcon.svg'),
                      const SizedBox(width: 3),
                      Text(
                        balance.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 17,
                          color: aPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
                  ],
                )
              ],
            ),
          ),
          /* Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                CustomerDetails.routeName,
                arguments: customerName,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: aPrimaryColor,
                ),
                child: const Text(
                  'view',
                  style: TextStyle(
                    fontSize: 15,
                    color: aLightTextColor,
                  ),
                ),
              ),
            ),
          ), */
        ],
      ),
    );
  }
}

class MaterialImage extends StatelessWidget {
  const MaterialImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color: aBgColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.grey,
            offset: Offset(1, 0),
          )
        ],
      ),
      child: SvgPicture.asset('assets/icons/person.svg'),
    );
  }
}
