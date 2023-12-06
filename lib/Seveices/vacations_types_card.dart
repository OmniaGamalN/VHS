import 'package:flutter/material.dart';

class VacationsTypesCard extends StatelessWidget {
  const VacationsTypesCard({
    super.key,
    required this.vacationsIconColor,
    required this.vacationTypesCardTitle,
    required this.daysNumber,
  });

  final String vacationsIconColor;
  final String? vacationTypesCardTitle;
  final int daysNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 207,
          height: 163,
          child: Card(
            color: Color(int.parse(vacationsIconColor.substring(1), radix: 16) +
                    0xFF000000)
                .withOpacity(0.3),
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.calendar_month,
                  color: Color(
                      int.parse(vacationsIconColor.substring(1), radix: 16) +
                          0xFF000000),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                vacationTypesCardTitle!,
                style: const TextStyle(
                    fontFamily: 'Bahij',
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              ),
              Row(
                children: [
                  Text(
                    '$daysNumber',
                    style: TextStyle(
                        fontFamily: 'Bahij',
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(int.parse(vacationsIconColor.substring(1),
                                radix: 16) +
                            0xFF000000)),
                  ),
                  const Text(
                    'Days',
                    style: TextStyle(
                      fontFamily: 'Bahij',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
