import 'package:challene1/constent.dart';
import 'package:challene1/networking/get_user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

String? jwtToken;
int? id;
List<String>? roles = [];
Map<String, dynamic>? profileData;

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> getTokens() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    jwtToken = pref.getString('jwtToken');
    id = pref.getInt('id');
    final jsonString = pref.getString('roles');
    roles = jsonString != null ? jsonString.split(',') : [];
  }

  Future<bool> getProfileInfo() async {
    if (jwtToken != null && id != null) {
      UserProfileModel userProfileModel = UserProfileModel(jwtToken!, id!);
      try {
        profileData = await userProfileModel.getUserData();
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  String? email;
  String? name;
  String? empNo;
  String? departmentName;
  String? mobileNum;
  String? birthData;
  String? birthPlace;
  int? gender;
  String? joiningDate;
  void setProfileData() {
    //print(profileData);
    setState(() {
      email = profileData!['employeeData']['email'] ?? '-';
      if (email!.isEmpty) {
        email = '-';
      }
      empNo = profileData!['employeeData']['empNo'] ?? '-';
      if (empNo!.isEmpty) {
        empNo = '-';
      }
      mobileNum = profileData!['employeeData']['mobileNumber'] ?? '-';
      if (mobileNum!.isEmpty) {
        mobileNum = '-';
      }
      name = profileData!['employeeData']['name'] ?? '-';
      if (name!.isEmpty) {
        name = '-';
      }
      departmentName = profileData!['employeeData']['departmentName'] ?? '-';
      if (departmentName!.isEmpty) {
        departmentName = '-';
      }
      birthPlace = profileData!['employeeData']['birthPlace'] ?? '-';
      if (birthPlace!.isEmpty) {
        birthPlace = '-';
      }
      gender = profileData!['employeeData']['gender'] ?? '-';
      birthData = profileData!['employeeData']['birthDateString'] != null
          ? DateFormat('dd-MM-yyyy').format(
              DateTime.parse(profileData!['employeeData']['birthDateString']))
          : '-';
      if (birthData!.isEmpty) {
        birthData = '-';
      }
      joiningDate = profileData!['employeeData']['joiningDateString'] != null
          ? DateFormat('dd-MM-yyyy').format(
              DateTime.parse(profileData!['employeeData']['joiningDateString']),
            )
          : '-';
      if (joiningDate!.isEmpty) {
        joiningDate = '-';
      }
    });
  }

  Future<void> initSetup() async {
    await getTokens();
    bool dataCheck = await getProfileInfo();
    if (dataCheck) {
      setProfileData();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSetup();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: SvgPicture.asset('images/layout.svg'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Center(
                    child: Image(
                      image: AssetImage('images/ejada_logo.png'),
                      width: 98,
                      height: 32,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Bahij',
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                        fontFamily: 'Bahij',
                        fontWeight: FontWeight.w500,
                        fontSize: 28.0,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 190,
              left: 10,
              right: 10,
              child: SizedBox(
                width: 390,
                height: 480,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Stack(
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 130.0),
                        child: SizedBox(
                          width: 148,
                          height: 148,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                              'images/profImage.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 250.0),
                        child: Container(
                          width: 106.39,
                          height: 32.38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: color1,
                          ),
                          child: Center(
                            child: Text(
                              empNo ?? '',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Bahij'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  name ?? '',
                  style: const TextStyle(
                      fontFamily: 'Bahij',
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                Text(
                  departmentName ?? '',
                  style: const TextStyle(
                    fontFamily: 'Bahij',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: color3,
                  ),
                ),
                roles!.contains('ROLE_ADMIN')
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/rank.png'),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Admin Account',
                            style: kProfileBlackText,
                          ),
                        ],
                      )
                    : const Text(''),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25, top: 20),
                  child: Row(
                    children: [
                      Text('Email', style: kProfileBlueText),
                      Spacer(
                        flex: 1,
                      ),
                      Text('Mobile', style: kProfileBlueText),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, top: 2, bottom: 25),
                  child: Row(
                    children: [
                      Text(email ?? '', style: kProfileBlackText),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(mobileNum ?? '', style: kProfileBlackText),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25, top: 20),
                  child: Row(
                    children: [
                      Text('Birthdate', style: kProfileBlueText),
                      Spacer(
                        flex: 1,
                      ),
                      Text('Birth Place', style: kProfileBlueText),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, top: 2, bottom: 25),
                  child: Row(
                    children: [
                      Text(birthData ?? '', style: kProfileBlackText),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(birthPlace ?? '', style: kProfileBlackText),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25, top: 20),
                  child: Row(
                    children: [
                      Text('Gender', style: kProfileBlueText),
                      Spacer(
                        flex: 1,
                      ),
                      Text('Join Date', style: kProfileBlueText),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25, top: 2),
                  child: Row(
                    children: [
                      Text(gender == 0 ? 'Male' : 'Female',
                          style: kProfileBlackText),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(joiningDate ?? '', style: kProfileBlackText),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
