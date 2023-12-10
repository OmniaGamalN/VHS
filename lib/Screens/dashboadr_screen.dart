import 'package:challene1/networking/get_emp_vacations_req.dart';
import 'package:challene1/networking/get_emp_vacations_types.dart';
import 'package:flutter/material.dart';
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
  String inputString = 'Welcome';
  int circleNum = 0;
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

  //TODO 3: doesn't need async
  void setEmpVacationsTypesVal() {
    empVacationsTypesList = empVacationCardData!['vacationType'];
    int usedDays;
    int totalDays;
    List<Widget> addIntoList = [];

    for (int i = 0; i < empVacationsTypesList.length; i++) {
      totalDays = empVacationsTypesList[i]["value"];
      usedDays = totalDays != 0 ? empVacationsTypesList[i]["usedValue"] : 0;

      //TODO 4: Don't call set state in a loop, instead make a separate list
      addIntoList.add(
        DashboardCard(
          cardTitle: empVacationsTypesList[i]["description"],
          useDays: usedDays,
          chartColor: empVacationsTypesList[i]["outerColor"],
          totalDays: totalDays,
        ),
      );
    }
    setState(() {
      dashboardList = addIntoList;
    });
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

  void setVacationsTypesVal() {
    vacationsTypesDataList = vacationCardData!['vacationTypes'];
    List<Widget> addIntoList = [];
    for (int i = 0; i < vacationsTypesDataList.length; i++) {
      addIntoList.add(
        VacationsTypesCard(
            vacationsIconColor: vacationsTypesDataList[i]["outerColor"],
            vacationTypesCardTitle: vacationsTypesDataList[i]["description"],
            daysNumber: vacationsTypesDataList[i]["allowedPeriod"]),
      );
    }
    setState(() {
      vacationsTypesList = addIntoList;
    });
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

  void setEmpVacationsRequestsVal() {
    empVacationsRequestsDataList = empVacationsRequestsCardData!["payload"];
    String vacationsTitle;
    String? requestedDate;
    int period;
    String? startDate;
    String? endDate;
    int statusCode;
    List<Widget> addIntoList = [];
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

      addIntoList.add(
        MyVacationCard(
            vacationsTitle: vacationsTitle,
            requestedDate: requestedDate,
            period: period,
            startDate: startDate,
            endDate: endDate,
            statusCode: statusCode),
      );
    }
    setState(() {
      empVacationsRequestsList = addIntoList;
    });
  }

  bool myDashboardCardCheck = true;
  bool vacationCrdCheck = true;
  bool empVacationCardCheck = true;

  Future<void> initSetup() async {
    await getTokens();
    bool empVacationsTypesCheck = await getEmpVacationsTypes();
    //TODO 2: no need for == true
    if (empVacationsTypesCheck) {
      setEmpVacationsTypesVal();
    } else {
      myDashboardCardCheck = false;
    }
    //TODO 5: what if all these functions returned false: conditional rendering
    bool vacationsTypesCheck = await getVacationsTypes();
    if (vacationsTypesCheck) {
      setVacationsTypesVal();
    } else {
      vacationCrdCheck = false;
    }
    bool empVacationsRequestsCheck = await getEmpVacationsRequests();
    if (empVacationsRequestsCheck) {
      setEmpVacationsRequestsVal();
    } else {
      empVacationCardCheck = false;
    }
  }

  @override
  void initState() {
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
              username: username!,
              formattedDate: formattedDate,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
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
                SizedBox(
                    height: 250,
                    child: myDashboardCardCheck
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: dashboardList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, top: 20),
                                child: dashboardList[index],
                              );
                            },
                          )
                        : const Text('No Data')),
                const Padding(
                  padding: EdgeInsets.only(left: 24.0, top: 20),
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
                    height: 200,
                    child: vacationCrdCheck
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: vacationsTypesList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, top: 20),
                                child: vacationsTypesList[index],
                              );
                            },
                          )
                        : const Text('No Data')),
                const Padding(
                  padding: EdgeInsets.only(left: 24.0, top: 20),
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
                    height: 250,
                    child: empVacationCardCheck
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: empVacationsRequestsList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, top: 20),
                                child: empVacationsRequestsList[index],
                              );
                            },
                          )
                        : const Text('No Data')),
                const Padding(
                  padding: EdgeInsets.only(left: 24.0, top: 20),
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
                        padding: const EdgeInsets.only(left: 5.0, top: 20),
                        child: ourFeatureList[index],
                      );
                    },
                  ),
                ),
                // Center(
                //   child: Row(
                //     children: [
                //       ReusableCircle(),
                //       ReusableCircle(),
                //       ReusableCircle(),
                //     ],
                //   ),
                // )
              ],
            )
          ],
        ),
      )),
    );
  }
}

class ReusableCircle extends StatelessWidget {
  const ReusableCircle({super.key, this.colour = Colors.grey});
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(shape: BoxShape.circle, color: colour),
      ),
    );
  }
}
