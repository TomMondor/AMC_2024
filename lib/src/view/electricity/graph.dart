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
    kcPrimary,
    kcSecondary,
  ];

  @override
  Widget build(BuildContext context) {
    final data = useState<HydroData?>(null);

    Future<HydroData> fetchData() async {
      HydroModel hydroData = await locator<HydroService>().getHydroData();
      int index = hydroData.indexDonneePlusRecent - 1;

      Detail details5 = hydroData.details[index];
      Detail details4 = hydroData.details[index - 1];
      Detail details3 = hydroData.details[index - 2];
      Detail details2 = hydroData.details[index - 3];
      Detail details1 = hydroData.details[index - 4];

      List<Detail> details = [
        details1,
        details2,
        details3,
        details4,
        details5,
      ];

      int maxY = details.map((detail) => detail.values.demandeTotal).reduce((max, current) => max! > current! ? max : current) as int;

      HydroData newData =
          HydroData(dateStart: hydroData.dateStart, dateEnd: hydroData.dateEnd, mostRecentIndex: index, details: details, maxY: maxY);
      return newData;
    }

    useEffect(() {
      fetchData().then((value) => data.value = value);
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
            child: data.value != null
                ? LineChart(
                    mainData(data.value!),
                  )
                : Container(),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'avg',
              style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.5)),
            ),
          ),
        ),
      ],
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
      titlesData: const FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
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
          shadow: const Shadow(
            blurRadius: 8,
          ),
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
