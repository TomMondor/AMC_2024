import 'package:amc_2024/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardTip extends StatelessWidget {
  final IconData topIcon;
  final String descriptionText;
  final String titleText;

  const CardTip({super.key, required this.topIcon, required this.descriptionText, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: kcPrimary,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 260,
          height: 105,
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(topIcon, color: Colors.white, size: 25),
                  ),
                  Text(
                    titleText,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  descriptionText,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum SampleItem { itemOne, itemTwo, itemThree }

class PopupMenuExample extends StatefulWidget {
  const PopupMenuExample({super.key});

  @override
  State<PopupMenuExample> createState() => _PopupMenuExampleState();
}

class _PopupMenuExampleState extends State<PopupMenuExample> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      initialValue: selectedMenu,
      onSelected: (SampleItem item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text('Item 1'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('Item 2'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: Text('Item 3'),
        ),
      ],
    );
  }
}
