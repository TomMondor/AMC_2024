import 'package:amc_2024/injection_container.dart';
import 'package:amc_2024/src/application/electricity_service.dart';
import 'package:amc_2024/src/domain/electricity/hydro_model.dart';
import 'package:amc_2024/src/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HydroData {
  final String dateStart;
  final String dateEnd;
  final int mostRecentIndex;
  final List<Detail> details;
  final int maxY;

  HydroData({
    required this.dateStart,
    required this.dateEnd,
    required this.mostRecentIndex,
    required this.details,
    required this.maxY,
  });
}

class CoolChart extends HookWidget {
  List<Color> gradientColors = [
    kcBlue,
    kcBlueLight,
  ];

  final Function(int variation, bool hasIncreased, String pourcentageVariation)? methodFromParent;

  CoolChart({super.key, this.methodFromParent});

  @override
  Widget build(BuildContext context) {
    final data = useState<HydroData?>(null);

    Future<HydroData> fetchData() async {
      HydroModel hydroData = await locator<HydroService>().getHydroData();

      hydroData.details.where((element) => element.values.demandeTotal != null).toList().reversed.take(5).toList();

      int index = hydroData.indexDonneePlusRecent - 1;

      Detail details5 = hydroData.details[0];
      Detail details4 = hydroData.details[1];
      Detail details3 = hydroData.details[2];
      Detail details2 = hydroData.details[3];
      Detail details1 = hydroData.details[4];

      List<Detail> details = [
        details1,
        details2,
        details3,
        details4,
        details5,
      ];

      double calculatePourcentageVariation(double current, double previous) {
        return (100 - ((current / previous) * 100)).abs();
      }

      int maxY = details.map((detail) => detail.values.demandeTotal).reduce((max, current) => max! > current! ? max : current)!.toInt();
      HydroData newData =
          HydroData(dateStart: hydroData.dateStart, dateEnd: hydroData.dateEnd, mostRecentIndex: index, details: details, maxY: maxY);
      int variation = (details5.values.demandeTotal! - details1.values.demandeTotal!).toInt();
      bool hasIncreased = variation > 0 ? true : false;
      double pourcentageVariation = calculatePourcentageVariation(details5.values.demandeTotal!, details1.values.demandeTotal!);
      String formattedPourcentageVariation = pourcentageVariation.toStringAsFixed(1);

      methodFromParent?.call(variation, hasIncreased, formattedPourcentageVariation);

      return newData;
    }

    useEffect(() {
      fetchData().then((value) => data.value = value);
    }, []);

    return Stack(
      children: <Widget>[
        data.value == null
            ? const Center(child: CircularProgressIndicator())
            : AspectRatio(
                aspectRatio: 1.70,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                    bottom: 12,
                  ),
                  child: LineChart(
                    mainData(data.value!),
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
      color: kcBlue,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('45 min.', style: style);
        break;
      case 3:
        text = const Text('15 min.', style: style);
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

  LineChartData mainData(HydroData data) {
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
      minY: data.maxY.toDouble() - 1500,
      maxY: data.maxY.toDouble(),
      lineBarsData: [
        LineChartBarData(
          showingIndicators: [0, 1, 2, 3, 4],
          spots: [
            FlSpot(0, data.details[0].values.demandeTotal!.toDouble()),
            FlSpot(1, data.details[1].values.demandeTotal!.toDouble()),
            FlSpot(2, data.details[2].values.demandeTotal!.toDouble()),
            FlSpot(3, data.details[3].values.demandeTotal!.toDouble()),
            FlSpot(4, data.details[4].values.demandeTotal!.toDouble()),
          ],
          isCurved: true,
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
