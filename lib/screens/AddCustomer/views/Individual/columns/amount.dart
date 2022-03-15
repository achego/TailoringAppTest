import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gods_love/screens/AddCustomer/views/Individual/components/container_with_stack_name.dart';
import 'package:gods_love/screens/home/widgets/search_box.dart';

import '../../../../../constants.dart';

class Amount extends StatefulWidget {
  final TextEditingController? price;
  final TextEditingController? advance;
  const Amount({
    Key? key,
    required this.size,
    this.price,
    this.advance,
  }) : super(key: key);

  final Size size;

  @override
  State<Amount> createState() => _AmountState();
}

class _AmountState extends State<Amount> {
  int balance = 0;

  void clacBalance(advance) {
    setState(() {
      balance = int.parse(widget.price!.text) - int.parse(advance);
    });
    print(balance);
  }

  @override
  Widget build(BuildContext context) {
    return ContainerWithStackName(
      top: -14,
      left: 10,
      name: const Text('Amount: '),
      color: aPrimaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: aDefaultPadding,
          vertical: aDefaultPadding * 0.7,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Price: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                SearchBox(
                  controller: widget.price,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset('assets/icons/ngnIcon.svg'),
                  ),
                  width: widget.size.width * 0.3,
                  height: 30,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(width: widget.size.width * 0.15),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Advance: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                SearchBox(
                  controller: widget.advance,
                  onChanged: clacBalance,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset('assets/icons/ngnIcon.svg'),
                  ),
                  width: widget.size.width * 0.3,
                  height: 30,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(width: widget.size.width * 0.15),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Balance: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: widget.size.width * 0.3,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SvgPicture.asset('assets/icons/ngnIcon.svg'),
                      ),
                      Text(
                        '$balance',
                        style: const TextStyle(
                          color: aPrimaryColor,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: widget.size.width * 0.15),
              ],
            )
          ],
        ),
      ),
    );
  }
}
