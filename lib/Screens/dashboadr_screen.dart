import 'package:challene1/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../Seveices/our_feature_card.dart';
import '../Seveices/reusable_background.dart';
import '../Seveices/my_vacations_card.dart';
import '../Seveices/dashboardcard1.dart';
import '../Seveices/vacations_types_card.dart';

class DashboardPage extends StatefulWidget {
  //static const String? id = 'welcome_page';
  final Map<String, dynamic> userData;
  const DashboardPage(this.userData, {super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUserData(widget.userData);
  }

  int? useDays = 5;
  double? shadow = 5;
  String? perUsedDays;
  final Color pieChartColor = const Color(0xff013168);
  String? cardTitle = 'Regular Vacation';
  Color dashboardCardColor = Colors.white;
  Color vacationCardColor = const Color(0xffE4EFF5);
  Color vacationsIconColor = const Color(0xff0C57A8);
  Color myVacationCardColor = Colors.white;
  String? vacationsTitle = 'Sick Vacation';
  String? requestedDate = '07-2-2023 02:23';
  String? period = '1';
  String? startDate = '06-2-2023';
  String? endDate = '06-2-2023';
  String? email;
  String? username;
  int? statusCode = 1;
  Color? boxColor = const Color(0xffFCD0CD);
  String? inputString = 'Welcome';
  String? featureTitle = 'Request Vacation Remotely';
  String? imageName = 'icon1';
  String? featureCardTitle = 'Request Vacation Remotely';
  Color featureCardColor = Colors.white;
  String featureIcon = 'icon1';
  int daysNumber = 21;
  List<Widget> dashboardList = [
    DashboardCard(
      cardTitle: 'Regular Vacation',
      useDays: 5,
      cardColor: Colors.white,
      totalDays: 21,
      chartColor: const Color(0xff0C57A8),
    ),
    DashboardCard(
        cardTitle: 'Sick Vacation',
        cardColor: Colors.white,
        useDays: 12,
        totalDays: 21,
        chartColor: Colors.tealAccent)
  ];
  List<Widget> vacationsTypesList = [
    const VacationsTypesCard(
        vacationsIconColor: Color(0xff0C57A8),
        vacationTypesCardTitle: 'Regular Vacation',
        daysNumber: 16),
    const VacationsTypesCard(
        vacationsIconColor: Color(0xffFFC043),
        vacationTypesCardTitle: 'Sick Vacation',
        daysNumber: 16),
  ];
  String? vacationTypesCardTitle = 'Regular Vacation';
  List<String> featureList = [
    'Request your vacation, Track the request and Receive the response.',
    'Each request will follow the workflow to the mangers for approval.',
  ];
  List<Widget> myVacationsList = [
    MyVacationCard(
        vacationsTitle: 'Sick Vacation',
        requestedDate: '07-2-2023 02:23',
        period: '2',
        startDate: '06-2-2023',
        endDate: '08-2-2023',
        statusCode: 3),
    MyVacationCard(
        vacationsTitle: 'Regular Vacation',
        requestedDate: '07-12-2022 011:23',
        period: '2',
        startDate: '06-2-2023',
        endDate: '08-2-2023',
        statusCode: 1)
  ];
  List<Widget> ourFeatureList = [
    const OurFeatureCard(
        featureCardColor: Colors.white,
        featureCardTitle: 'Request Vacation Remotely',
        featureList: [
          'Request your vacation, Track the request and Receive the response.',
          'Each request will follow the workflow to the mangers for approval.',
        ],
        icon: 'icon1'),
    const OurFeatureCard(
        featureCardColor: Colors.white,
        featureCardTitle: 'Request Vacation Remotely',
        featureList: [
          'Request your vacation, Track the request and Receive the response.',
          'Each request will follow the workflow to the mangers for approval.',
        ],
        icon: 'icon1')
  ];
  void setUserData(dynamic data) {
    username = data['username'];
    email = data['email'];
  }

  @override
  Widget build(BuildContext context) {
    DateTime myDate = DateTime.now();
    String formattedDate = DateFormat('d MMMM, y').format(myDate);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Stack(
          children: [
            ReusableBackground(
              inputString: inputString,
              username: username,
              formattedDate: formattedDate,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 240,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'My Dashboard',
                    style: TextStyle(
                      fontFamily: 'Bahij',
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff444446),
                    ),
                  ),
                ),
                SizedBox(
                  height: 220,
                  //color: Colors.white,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: dashboardList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                        ),
                        child: dashboardList[index],
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Vacations Types',
                    style: TextStyle(
                      fontFamily: 'Bahij',
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff444446),
                    ),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: vacationsTypesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: vacationsTypesList[index],
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'My vacations',
                    style: TextStyle(
                      fontFamily: 'Bahij',
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff444446),
                    ),
                  ),
                ),
                SizedBox(
                  height: 215,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: myVacationsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: myVacationsList[index],
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Our Features',
                    style: TextStyle(
                      fontFamily: 'Bahij',
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff444446),
                    ),
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: ourFeatureList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: ourFeatureList[index],
                      );
                    },
                  ),
                ),
                // OurFeatureCard(
                //   featureCardColor: featureCardColor,
                //   featureCardTitle: featureCardTitle,
                //   featureList: featureList,
                //   icon: featureIcon,
                // ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
