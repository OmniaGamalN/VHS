import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DashboardCard extends StatelessWidget {
  DashboardCard({
    super.key,
    required this.cardTitle,
    required this.chartColor,
    required this.useDays,
    this.cardColor = Colors.white,
    required this.totalDays,
  });
  final Color? cardColor;
  final String? cardTitle;
  final String? chartColor;
  final List<Color> colorList = [
    const Color(0xffF2F2F7),
    const Color(0xff013168),
  ];
  final int? useDays;
  final int? totalDays;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 214,
          width: 207,
          child: Card(
            color: cardColor,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 14,
          left: 20,
          child: Text(
            cardTitle!,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontFamily: 'Bahij'),
          ),
        ),
        Positioned(
          top: 45,
          left: 5,
          child: PieChart(
            dataMap: {
              'Total $totalDays Day': 21,
              'Used $useDays Day': 5,
            },
            chartRadius: MediaQuery.of(context).size.width / 4.8,
            ringStrokeWidth: 8,
            chartType: ChartType.ring,
            baseChartColor: const Color(0xffF2F2F7),
            colorList: [
              const Color(0xffF2F2F7),
              Color(
                  int.parse(chartColor!.substring(1), radix: 16) + 0xFF000000),
            ],
            centerText: totalDays != 0
                ? '${(useDays! / totalDays! * 100).toStringAsFixed(2)}%'
                : '0%',
            chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
                showChartValueBackground: false,
                showChartValues: false,
                decimalPlaces: 1),
            totalValue: totalDays!.toDouble(),
            legendOptions: const LegendOptions(
              legendPosition: LegendPosition.bottom,
              showLegendsInRow: true,
              legendTextStyle: TextStyle(
                fontSize: 12,
                fontFamily: 'Bahij',
                fontWeight: FontWeight.w500,
                color: Color(0xff48484A),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
