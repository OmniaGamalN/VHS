import 'dart:ffi';

import 'package:challene1/constent.dart';
import 'package:challene1/networking/get_emp_vacations_req.dart';
import 'package:challene1/networking/get_emp_vacations_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../Seveices/our_feature_card.dart';
import '../Seveices/reusable_background.dart';
import '../Seveices/my_vacations_card.dart';
import '../Seveices/dashboardcard1.dart';
import '../Seveices/vacations_types_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../networking/get_vacations_types.dart';

class DashboardPage extends StatefulWidget {
  //static const String? id = 'welcome_page';
  final Map<String, dynamic> userData;
  const DashboardPage(this.userData, {super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, dynamic>? empVacationCardData;
  Map<String, dynamic>? vacationCardData;
  Map<String, dynamic>? empVacationsRequestsCardData;
  String? jwtToken;
  int? id;
  String? email;
  String? username;
  String? inputString = 'Welcome';
  List<dynamic> empVacationsTypesList = [];
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
        featureCardTitle: 'Edit & Delete Requests',
        featureList: [
          'You can delete or modify any vacation request as long as no action was taken.'
        ],
        icon: 'icon2'),
    const OurFeatureCard(
        featureCardColor: Colors.white,
        featureCardTitle: 'Vacations History',
        featureList: [
          'ou can view all your vacations and have statistics for better overview of your vacation flow.You can filter your vacations according to your preferable aspects'
        ],
        icon: 'icon3'),
  ];
  void setUserData(dynamic data) {
    username = data['username'];
    email = data['email'];
  }

  Future<void> getTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    jwtToken = prefs.getString('jwtToken');
    id = prefs.getInt('id');
  }

  Future<bool> getEmpVacationsTypes() async {
    if (jwtToken != null && id != null) {
      EmpVacationsTypesModel empVacationsTypesModel =
          EmpVacationsTypesModel(jwtToken!, id!);
      try {
        empVacationCardData =
            await empVacationsTypesModel.postEmpVacationsTypes();
        return true;
      } catch (e) {
        //print(e);
        return false;
      }
    } else {
      //print('Error');
      return false;
    }
  }

  List<Widget> dashboardList = [];
  Future<void> setEmpVacationsTypesVal() async {
    empVacationsTypesList = await empVacationCardData!['vacationType'];
    int? usedDays;
    int? totalDays;
    for (int i = 0; i < empVacationsTypesList.length; i++) {
      totalDays = empVacationsTypesList[i]["value"];
      usedDays = totalDays != 0 ? empVacationsTypesList[i]["usedValue"] : 0;

      setState(() {
        dashboardList.add(
          DashboardCard(
            cardTitle: empVacationsTypesList[i]["description"],
            useDays: usedDays,
            chartColor: empVacationsTypesList[i]["outerColor"],
            totalDays: totalDays,
          ),
        );
      });
    }
  }

  List<dynamic> vacationsTypesDataList = [];
  List<Widget> vacationsTypesList = [];
  Future<bool> getVacationsTypes() async {
    if (jwtToken != null && id != null) {
      VacationsTypesModel vacationsTypesModel =
          VacationsTypesModel(jwtToken!, id!);
      try {
        vacationCardData = await vacationsTypesModel.postVacationsTypes();
        return true;
      } catch (e) {
        //print(e);
        return false;
      }
    } else {
      //print('Error');
      return false;
    }
  }

  Future<void> setVacationsTypesVal() async {
    vacationsTypesDataList = await vacationCardData!['vacationTypes'];
    for (int i = 0; i < vacationsTypesDataList.length; i++) {
      setState(() {
        vacationsTypesList.add(
          VacationsTypesCard(
              vacationsIconColor: vacationsTypesDataList[i]["outerColor"],
              vacationTypesCardTitle: vacationsTypesDataList[i]["description"],
              daysNumber: vacationsTypesDataList[i]["allowedPeriod"]),
        );
      });
    }
  }

  List<dynamic> empVacationsRequestsDataList = [];
  List<Widget> empVacationsRequestsList = [];
  Future<bool> getEmpVacationsRequests() async {
    if (jwtToken != null && id != null) {
      EmpVacationsRequestsModel empVacationsRequestsModel =
          EmpVacationsRequestsModel(jwtToken!, id!);
      try {
        empVacationsRequestsCardData =
            await empVacationsRequestsModel.postEmpVacationsRequests();
        return true;
      } catch (e) {
        //print(e);
        return false;
      }
    } else {
      //print('Error');
      return false;
    }
  }

  Future<void> setEmpVacationsRequestsVal() async {
    empVacationsRequestsDataList =
        await empVacationsRequestsCardData!["payload"];
    String? vacationsTitle;
    String? requestedDate;
    int? period;
    String? startDate;
    String? endDate;
    int? statusCode;
    for (int i = 0; i < empVacationsRequestsDataList.length; i++) {
      vacationsTitle = empVacationsRequestsDataList[i]["type"];
      requestedDate = requestedDate != null
          ? DateFormat('dd-MM-yyyy HH:mm').format(
              DateTime.parse(
                  empVacationsRequestsDataList[i]["requestDateString"]),
            )
          : '-';
      period = empVacationsRequestsDataList[i]["period"] ?? 0;
      startDate = startDate != null
          ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
              empVacationsRequestsDataList[i]["startDateString"]))
          : '-';
      endDate = endDate != null
          ? DateFormat('dd-MM-yyyy').format(
              DateTime.parse(empVacationsRequestsDataList[i]["endDateString"]))
          : '-';
      statusCode = empVacationsRequestsDataList[i]["status"];
      setState(() {
        empVacationsRequestsList.add(
          MyVacationCard(
              vacationsTitle: vacationsTitle,
              requestedDate: requestedDate,
              period: period,
              startDate: startDate,
              endDate: endDate,
              statusCode: statusCode),
        );
      });
    }
  }

  Future<void> initSetup() async {
    await getTokens();
    bool empVacationsTypesCheck = await getEmpVacationsTypes();
    if (empVacationsTypesCheck == true) {
      await setEmpVacationsTypesVal();
    }
    bool vacationsTypesCheck = await getVacationsTypes();
    if (vacationsTypesCheck == true) {
      await setVacationsTypesVal();
    }
    bool empVacationsRequestsCheck = await getEmpVacationsRequests();
    if (empVacationsRequestsCheck == true) {
      await setEmpVacationsRequestsVal();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUserData(widget.userData);
    initSetup();
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
                    itemBuilder: (context, index) {
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
                    itemBuilder: (context, index) {
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
                    itemCount: empVacationsRequestsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: empVacationsRequestsList[index],
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
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: ourFeatureList[index],
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
