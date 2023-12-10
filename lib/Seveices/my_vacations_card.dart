import 'package:challene1/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyVacationCard extends StatelessWidget {
  MyVacationCard({
    super.key,
    this.myVacationCardColor = Colors.white,
    required this.vacationsTitle,
    required this.requestedDate,
    required this.period,
    required this.startDate,
    required this.endDate,
    required this.statusCode,
  });

  final Color myVacationCardColor;
  final String vacationsTitle;
  final String requestedDate;
  final int period;
  final String startDate;
  final String endDate;
  final int statusCode;

  //TODO 8: final fields on stateless widget
  final Map<int, String> vacationStatus = {
    1: 'Accepted',
    2: 'Rejected',
    3: 'UnderApproval'
  };
  String statusCheck(int status) {
    if (status == 1) {
      return vacationStatus[1]!;
    } else if (status == 2) {
      return vacationStatus[2]!;
    } else {
      return vacationStatus[3]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 300,
          height: 210,
          child: Card(
            color: myVacationCardColor,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    vacationsTitle,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        fontFamily: 'Bahij'),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  SvgPicture.asset('images/${statusCheck(statusCode)}.svg')
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const ReusableComponent(
                        title: 'Request Date',
                      ),
                      Text(
                        requestedDate,
                        style: kDateText,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Column(
                    children: [
                      const ReusableComponent(
                        title: 'Period  ',
                      ),
                      Text(
                        '$period',
                        //textAlign: TextAlign.start,
                        style: kDateText,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const ReusableComponent(
                        title: 'Start Date  ',
                      ),
                      Text(
                        startDate,
                        style: kDateText,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Column(
                    children: [
                      const ReusableComponent(
                        title: 'End Date',
                      ),
                      Text(
                        endDate,
                        style: kDateText,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        const Positioned(
          left: 220,
          top: 141,
          child: Image(
            image: AssetImage(
              'images/Intersect.png',
            ),
          ),
        ),
        Positioned(
          left: 265,
          top: 175,
          child: GestureDetector(
            child: const Image(
              image: AssetImage(
                'images/Arrow.png',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ReusableComponent extends StatelessWidget {
  const ReusableComponent({super.key, required this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('images/Ellipse2.svg'),
        const SizedBox(
          width: 2,
        ),
        Text(
          title!,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: 'Bahij'),
        ),
      ],
    );
  }
}
