import 'dart:async';
import 'dart:math';

import 'package:amc_2024/src/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeChart extends HookWidget {
  List<Color> gradientColors = [
    kcPrimary,
    kcSecondary,
  ];

  HomeChart({super.key});

  @override
  Widget build(BuildContext context) {
    final data = useState<List<FlSpot>>([
      const FlSpot(0, 1600),
      const FlSpot(1, 1250),
      const FlSpot(2, 600),
      const FlSpot(3, 900),
      const FlSpot(4, 843),
    ]);

    void updateSpots() {
      final random = Random();
      List<FlSpot> temp = [
        FlSpot(0, data.value[1].y),
        FlSpot(1, data.value[2].y),
        FlSpot(2, data.value[3].y),
        FlSpot(3, data.value[4].y),
        FlSpot(4, random.nextDouble() * 1200 + 200),
      ];
      // Update the state
      data.value = temp;
    }

    useEffect(() {
      Future<void> updatePeriodically() async {
        while (true) {
          await Future.delayed(const Duration(seconds: 2));
          updateSpots();
        }
      }

      updatePeriodically();

      return () {
        // Cleanup if needed
      };
    }, []);

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              mainData(data.value),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('45 min. ago', style: style);
        break;
      case 3:
        text = const Text('15 min. ago', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(List<FlSpot> spots) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 300,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: kcPrimaryVariant,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: kcPrimary,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color.fromARGB(80, 55, 67, 77)),
      ),
      minX: 0,
      maxX: 4,
      minY: 0,
      maxY: 1600,
      lineBarsData: [
        LineChartBarData(
          showingIndicators: [0, 1, 2, 3, 4],
          spots: spots,
          isCurved: false,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          aboveBarData: BarAreaData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
