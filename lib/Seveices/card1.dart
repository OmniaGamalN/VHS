import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
    return Container(
      height: 217,
      width: 207,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 2,
            ),
            Text(
              cardTitle!,
              style: TextStyle(
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
              baseChartColor: Color(0xffF2F2F7),
              colorList: colorList,
              chartValuesOptions: ChartValuesOptions(
                  showChartValuesInPercentage: true,
                  showChartValueBackground: false,
                  showChartValues: true),
              legendOptions: LegendOptions(
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
        color: cardColor,
        elevation: shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
