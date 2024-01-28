import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/transport/number_label.dart';
import 'package:amc_2024/src/view/transport/tip_item.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

class Transport extends StatefulWidget {
  const Transport({super.key});

  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> with TickerProviderStateMixin {
  int _average = 1230;

  @override
  void initState() {
    super.initState();
  }

  Color? calculateTextColor(double value) {
    double position = (value - 0.0) / (1.0 - 0.0);
    position = position.clamp(0.0, 1.0);

    return ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).lerp(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Transport',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: kcPrimaryVariant),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Average",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AnimatedDigitWidget(
                    value: _average,
                    textStyle: TextStyle(
                        color: calculateTextColor(0.75),
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: const Column(children: [
                Text(
                  "Footprint",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberLabel(score: 75, descriptionText: "Walk"),
                    NumberLabel(score: 105, descriptionText: "Car"),
                    NumberLabel(score: 5, descriptionText: "Bus"),
                  ],
                ),
                Divider(),
              ]),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: const [
                  TipItem(
                      iconData: Icons.qr_code,
                      titleText: "Use the Cahome Setup Code",
                      descriptionText:
                          "You can control all your Smart Home and Enjoy Smart Life"),
                  TipItem(
                      iconData: Icons.qr_code,
                      titleText: "Use the Cahome Setup Code",
                      descriptionText:
                          "You can control all your Smart Home and Enjoy Smart Life"),
                  TipItem(
                      iconData: Icons.qr_code,
                      titleText: "Use the Cahome Setup Code",
                      descriptionText:
                          "You can control all your Smart Home and Enjoy Smart Life"),
                  TipItem(
                      iconData: Icons.qr_code,
                      titleText: "Use the Cahome Setup Code",
                      descriptionText:
                          "You can control all your Smart Home and Enjoy Smart Life"),
                ],
              ),
            ),
          ],
        ));
  }
}
