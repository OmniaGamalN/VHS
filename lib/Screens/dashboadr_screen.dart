import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Seveices/reusable_background.dart';
import '../Seveices/reusable_card2.dart';
import '../Seveices/rusable_card1.dart';

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
  Color vacationCardColor = Color(0xffE4EFF5);
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
  void setUserData(dynamic data) {
    username = data['username'];
    email = data['email'];
  }

  @override
  Widget build(BuildContext context) {
    DateTime myDate = DateTime.now();
    String formattedDate = DateFormat('d MMMM, y').format(myDate);
    return Scaffold(
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
              SizedBox(
                height: 250,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: DashboardCard(
                  cardTitle: cardTitle,
                  useDays: useDays,
                  cardColor: dashboardCardColor,
                  totalDays: 21,
                  chartColor: const Color(0xff013168),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Stack(
                  children: [
                    SizedBox(
                      width: 207,
                      height: 163,
                      child: Card(
                        color: vacationCardColor,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ReusableCard2(
                    vacationsTitle: vacationsTitle,
                    requestedDate: requestedDate,
                    period: period,
                    startDate: startDate,
                    endDate: endDate,
                    statusCode: statusCode),
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
              Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
          )
        ],
      ),
    ));
  }
}
