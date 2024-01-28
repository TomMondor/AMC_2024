import 'package:amc_2024/src/theme/colors.dart';
import 'package:flutter/material.dart';

enum ProductType {
  meat,
  fish,
  fruit,
  vegetable,
  other,
}

class LeftoverLabel extends StatelessWidget {
  final ProductType productType;

  const LeftoverLabel({super.key, required this.productType});

  String getNameForProductType(ProductType productType) {
    switch (productType) {
      case ProductType.meat:
        return "Viande";
      case ProductType.fish:
        return "Fish";
      case ProductType.fruit:
        return "Fruits";
      case ProductType.vegetable:
        return "Veggies";
      case ProductType.other:
        return "Other";
      default:
        return "N/A";
    }
  }

  Color getColorForProductType(ProductType productType) {
    switch (productType) {
      case ProductType.meat:
        return Colors.yellow;
      case ProductType.fish:
        return Colors.green;
      case ProductType.fruit:
        return Colors.red;
      case ProductType.vegetable:
        return Colors.blue;
      case ProductType.other:
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  Color getShadedColorForProductType(ProductType productType) {
    Color color = getColorForProductType(productType);
    return color.withOpacity(0.4);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 75.0,
          height: 32.0,
          foregroundDecoration: BoxDecoration(
            color: getShadedColorForProductType(productType),
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(
              color: getColorForProductType(productType),
              width: 2.0,
            ),
          ),
          child: Center(
            child: Text(
              getNameForProductType(productType),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
