/// Flutter package imports
import 'package:amc_2024/src/theme/colors.dart';
import 'package:flutter/material.dart';

/// Gauge imports
import 'package:syncfusion_flutter_gauges/gauges.dart';

/// Local imports

/// Renders the gauge multiple range sample
class RadialGaugeConsumption extends StatefulWidget {
  /// Creates the gauge multiple range sample
  const RadialGaugeConsumption({Key? key}) : super(key: key);

  @override
  _MultipleRangesExampleState createState() => _MultipleRangesExampleState();
}

class _MultipleRangesExampleState extends State<RadialGaugeConsumption> {
  _MultipleRangesExampleState();

  @override
  Widget build(BuildContext context) {
    return _buildMultipleRangesExampleGauge(context);
  }

  /// Returns the multiple range gauge
  SfRadialGauge _buildMultipleRangesExampleGauge(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            showAxisLine: false,
            showLabels: false,
            showTicks: false,
            startAngle: 180,
            endAngle: 360,
            maximum: 80,
            canScaleToFit: true,
            pointers: <GaugePointer>[
              NeedlePointer(
                  needleColor: kcPrimaryVariant.withOpacity(0.9),
                  value: 30,
                  needleEndWidth: 10,
                  needleLength: 0.7,
                  knobStyle: const KnobStyle(color: kcPrimaryVariant))
            ],
            ranges: <GaugeRange>[
              GaugeRange(startValue: 0, endValue: 18, sizeUnit: GaugeSizeUnit.factor, startWidth: 0, endWidth: 0.1, color: kcPrimary),
              GaugeRange(startValue: 20, endValue: 38, startWidth: 0.1, sizeUnit: GaugeSizeUnit.factor, endWidth: 0.15, color: kcSecondary),
              GaugeRange(
                  startValue: 40,
                  endValue: 58,
                  startWidth: 0.15,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.2,
                  color: Colors.orange),
              GaugeRange(startValue: 60, endValue: 78, startWidth: 0.2, sizeUnit: GaugeSizeUnit.factor, endWidth: 0.25, color: kcRed),
            ]),
      ],
    );
  }
}
