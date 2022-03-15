import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';

class DetailsAmount extends StatelessWidget {
  const DetailsAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (ctx, i) => Container(
        margin: EdgeInsets.symmetric(
          vertical: aDefaultPadding * 0.4,
          horizontal: aDefaultPadding,
        ),
        decoration: _decorateModel(),
        child: Row(
          children: [
            Expanded(flex: 3, child: MaterialImage()),
            SizedBox(width: 0),
            Expanded(flex: 10, child: NameAndOtherInfo(i: i)),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _decorateModel() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: aBgColor,
    boxShadow: [
      const BoxShadow(
        color: Colors.grey,
        blurRadius: 4,
        offset: Offset(0, 1),
      ),
    ],
  );
}

class NameAndOtherInfo extends StatelessWidget {
  const NameAndOtherInfo({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: const Text(
            'Etibo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: aLightTextColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Total Sown:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Total Paid:',
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
                    '2',
                    style: const TextStyle(
                      fontSize: 15,
                      color: aPrimaryColor,
                    ),
                  ),
                  Row(children: [
                    SvgPicture.asset('assets/icons/ngnIcon.svg'),
                    const SizedBox(width: 3),
                    Text(
                      '2000',
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
      ],
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
      height: 83,
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
      child: SvgPicture.asset(
        'assets/icons/person.svg',
      ),
    );
  }
}
