import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';



//TODO 6: remove this
class Card1 extends StatelessWidget {
  const Card1({
    super.key,
    required this.cardTitle,
    required this.dataMap,
    required this.colorList,
    required this.cardColor,
    required this.shadow,
  });

  final String? cardTitle;
  final Map<String, double> dataMap;
  final List<Color> colorList;
  final Color cardColor;
  final double? shadow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 217,
      width: 207,
      child: Card(
        color: cardColor,
        elevation: shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 2,
            ),
            Text(
              cardTitle!,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  fontFamily: 'Bahij'),
            ),
            PieChart(
              dataMap: dataMap,
              chartRadius: MediaQuery.of(context).size.width / 4.4,
              ringStrokeWidth: 10,
              chartType: ChartType.ring,
              baseChartColor: const Color(0xffF2F2F7),
              colorList: colorList,
              chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: true,
                  showChartValueBackground: false,
                  showChartValues: true),
              legendOptions: const LegendOptions(
                legendPosition: LegendPosition.bottom,
                showLegendsInRow: true,
                legendTextStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Bahij',
                    fontWeight: FontWeight.w500,
                    color: Color(0xff48484A)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
