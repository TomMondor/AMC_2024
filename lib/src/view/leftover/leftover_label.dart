import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  String getNameForProductType(ProductType productType, BuildContext context) {
    switch (productType) {
      case ProductType.meat:
        return AppLocalizations.of(context)!.meat;
      case ProductType.fish:
        return AppLocalizations.of(context)!.fish;
      case ProductType.fruit:
        return AppLocalizations.of(context)!.fruit;
      case ProductType.vegetable:
        return AppLocalizations.of(context)!.vegetables;
      case ProductType.other:
        return AppLocalizations.of(context)!.other;
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
              getNameForProductType(productType, context),
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
