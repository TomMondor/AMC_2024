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
      const FlSpot(5, 1200),
      const FlSpot(6, 1430),
      const FlSpot(7, 1300),
      const FlSpot(8, 1150),
      const FlSpot(9, 1350),
      const FlSpot(10, 1200),
      const FlSpot(11, 1430),
      const FlSpot(12, 1300),
      const FlSpot(13, 1150),
      const FlSpot(14, 1350),
      const FlSpot(15, 1200),
      const FlSpot(16, 1430),
      const FlSpot(17, 1300),
      const FlSpot(18, 1150),
      const FlSpot(19, 1350),
      const FlSpot(20, 1200),
    ]);

    void updateSpots() {
      final random = Random();
      List<FlSpot> temp = [
        FlSpot(0, data.value[1].y),
        FlSpot(1, data.value[2].y),
        FlSpot(2, data.value[3].y),
        FlSpot(3, data.value[4].y),
        FlSpot(4, data.value[5].y),
        FlSpot(5, data.value[6].y),
        FlSpot(6, data.value[7].y),
        FlSpot(7, data.value[8].y),
        FlSpot(8, data.value[9].y),
        FlSpot(9, data.value[10].y),
        FlSpot(10, data.value[11].y),
        FlSpot(11, data.value[12].y),
        FlSpot(12, data.value[13].y),
        FlSpot(13, data.value[14].y),
        FlSpot(14, data.value[15].y),
        FlSpot(15, data.value[16].y),
        FlSpot(16, data.value[17].y),
        FlSpot(17, data.value[18].y),
        FlSpot(18, data.value[19].y),
        FlSpot(19, data.value[20].y),
        FlSpot(20, random.nextDouble() * 1200 + 200),
      ];
      // Update the state
      data.value = temp;
    }

    useEffect(() {
      Future<void> updatePeriodically() async {
        while (true) {
          await Future.delayed(const Duration(seconds: 3));
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
      case 7:
        text = const Text('45 sec. ago', style: style);
        break;
      case 14:
        text = const Text('15 sec. ago', style: style);
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
            color: kcLightSecondary,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: kcLightSecondary,
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
      maxX: 20,
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
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
