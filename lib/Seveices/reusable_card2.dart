import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReusableCard2 extends StatelessWidget {
  ReusableCard2({
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
  final String? vacationsTitle;
  final String? requestedDate;
  final String? period;
  final String? startDate;
  final String? endDate;
  final int? statusCode;

  Map<int, Widget> vacationStatus = {
    1: SvgPicture.asset('images/Accepted.svg'),
    2: SvgPicture.asset('images/Rejected.svg'),
    3: SvgPicture.asset('images/UnderApproval.svg'),
  };
  Widget statusCheck(int status) {
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
        Positioned(
          top: 25,
          left: 25,
          child: Text(
            vacationsTitle!,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 17,
                fontFamily: 'Bahij'),
          ),
        ),
        Positioned(
          top: 80,
          left: 25,
          child: SvgPicture.asset('images/Ellipse2.svg'),
        ),
        const Positioned(
          top: 72,
          left: 35,
          child: Text(
            'Request Date',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: 'Bahij'),
          ),
        ),
        Positioned(
          top: 140,
          left: 25,
          child: SvgPicture.asset('images/Ellipse2.svg'),
        ),
        const Positioned(
          top: 132,
          left: 35,
          child: Text(
            'Start Date',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: 'Bahij'),
          ),
        ),
        Positioned(
          top: 80,
          left: 200,
          child: SvgPicture.asset('images/Ellipse2.svg'),
        ),
        const Positioned(
          top: 72,
          left: 210,
          child: Text(
            'Period',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: 'Bahij'),
          ),
        ),
        Positioned(
          top: 140,
          left: 200,
          child: SvgPicture.asset('images/Ellipse2.svg'),
        ),
        const Positioned(
          top: 132,
          left: 210,
          child: Text(
            'End Date',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: 'Bahij'),
          ),
        ),
        Positioned(
          top: 87,
          left: 35,
          child: Text(
            requestedDate!,
            style: const TextStyle(
                color: Color(0xff0C57A8),
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: 'Bahij'),
          ),
        ),
        Positioned(
          top: 87,
          left: 210,
          child: Text(
            period!,
            style: const TextStyle(
                color: Color(0xff0C57A8),
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: 'Bahij'),
          ),
        ),
        Positioned(
          top: 147,
          left: 35,
          child: Text(
            startDate!,
            style: const TextStyle(
                color: Color(0xff0C57A8),
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: 'Bahij'),
          ),
        ),
        Positioned(
          top: 147,
          left: 210,
          child: Text(
            endDate!,
            style: const TextStyle(
                color: Color(0xff0C57A8),
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: 'Bahij'),
          ),
        ),
        const Positioned(
          top: 141,
          left: 220,
          child: Image(
            image: AssetImage('images/Intersect.png'),
          ),
        ),
        Positioned(
          top: 175,
          left: 265,
          child: GestureDetector(
            child: const Image(
              image: AssetImage('images/Arow.png'),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 200,
          child: statusCheck(statusCode!),
        )
      ],
    );
  }
}
