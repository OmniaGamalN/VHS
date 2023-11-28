import 'package:flutter/material.dart';

class VacationsTypesCard extends StatelessWidget {
  const VacationsTypesCard({
    super.key,
    required this.vacationCardColor,
    required this.vacationsIconColor,
    required this.vacationTypesCardTitle,
    required this.daysNumber,
  });

  final Color vacationCardColor;
  final Color vacationsIconColor;
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
            color: vacationCardColor,
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
                child: Icon(
                  Icons.calendar_month,
                  color: vacationsIconColor,
                ),
                backgroundColor: Colors.white,
              ),
              SizedBox(
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
                        color: vacationsIconColor),
                  ),
                  Text(
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
