import 'package:flutter/material.dart';
import 'package:gods_love/providers/customers.dart';
import 'package:gods_love/screens/home/widgets/search_box.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<Customers>(builder: (ctx, customers, child) {
          String hint = '';
          switch (customers.searchBy) {
            case 'Name':
              hint = 'search customers';
              break;
            case 'RelatedDate':
              hint = 'yyyy-mm-dd';
              break;
            case 'CollectionDate':
              hint = 'yyyy-mm-dd';
              break;
            case 'Measurement':
              hint = 'B S L N O';
              break;
            default:
          }
          return Expanded(
            child: SearchBox(
              hintText: hint,
              onChanged: (argument) {
                Provider.of<Customers>(context, listen: false)
                    .searchCustomerBy(argument);
              },
            ),
          );
        }),
        const SizedBox(width: 10),
        FilterButton(),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showFilterDialogue(context),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: aPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.filter_center_focus_sharp,
              color: aLightTextColor,
              size: 27,
            ),
          ),
          Positioned(
            top: -6,
            right: -6,
            child: Container(
              height: 19,
              width: 19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: aAccentColor,
              ),
              child: Consumer<Customers>(builder: (_, customers, chld) {
                return Text(customers.searchBy[0],
                    style: const TextStyle(
                      color: aBgColor,
                      fontWeight: FontWeight.w600,
                    ));
              }),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  _showFilterDialogue(context) {
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        title: Text('Search By'),
        children: [
          ListTile(
              title: Text('Name'), onTap: () => Navigator.pop(context, 'Name')),
          ListTile(
              title: Text('Related Date'),
              onTap: () => Navigator.pop(context, 'RelatedDate')),
          ListTile(
              title: Text('Collection Date'),
              onTap: () => Navigator.pop(context, 'CollectionDate')),
          ListTile(
              title: Text('Measurement'),
              onTap: () => Navigator.pop(context, 'Measurement')),
        ],
      ),
    ).then((argument) {
      print(argument);
      Provider.of<Customers>(context, listen: false).searchStatus(argument);
    });
  }
}
