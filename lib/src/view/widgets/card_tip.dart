import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardTip extends StatelessWidget {
  final IconData topIcon;
  final String descriptionText;

  const CardTip(
      {super.key, required this.topIcon,
        required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 110,
          height: 110,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(topIcon, color: Colors.green, size: 25),
            ],
          ),
        ),
      ),
    );
  }
}
