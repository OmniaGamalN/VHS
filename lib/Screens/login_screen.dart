import 'package:challene1/Screens/dashboadr_screen.dart';
import 'package:challene1/networking/post_user_data.dart';
import 'package:flutter/material.dart';
import 'package:challene1/Seveices/reusable_line.dart';
import 'package:challene1/constent.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

UserModel userModel = UserModel();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

Map<String, dynamic> userData = {};
final usernameController = TextEditingController();
final passwordController = TextEditingController();
bool isChecked = false;

class _LoginScreenState extends State<LoginScreen> {
  Future<bool> checkUsrValidation(String userName, String password) async {
    try {
      userData = await userModel.postUserData(
          userName = userName, password = password);

      if (userData['code'] == '001') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> setPrefs(String userName, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userName);
    prefs.setString('password', password);
  }

  Future<void> setTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('jwtToken', userData['jwtToken']);
    prefs.setInt('id', userData['id']);
    List<dynamic> roles = userData['roles'];
    final jsonString = roles.join(',');
    prefs.setString('roles', jsonString);
  }

  void loginIsRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userName = prefs.getString('userName');
    final password = prefs.getString('password');
    if (userName != null && password != null) {
      bool checkValue = await checkUsrValidation(userName, password);
      if (checkValue) {
        setTokens();
        //TODO 1: add a condition on context.mounted for safe navigation
        if (context.mounted) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashboardPage(userData)));
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loginIsRememberMe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Image(image: AssetImage('images/ejada_logo.png')),
            const SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: Container(
                height: 300.0,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Welcome !',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Log in into the Employees vacations system ',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (newValue) {
                                setState(() {
                                  isChecked = newValue ?? false;
                                });
                              }),
                          const Text(
                            'Remember Me',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          width: 411.4,
                          //height: 64,
                          child: MaterialButton(
                            onPressed: () async {
                              bool checkValue = await checkUsrValidation(
                                  usernameController.text.toString(),
                                  passwordController.text.toString());
                              if (checkValue) {
                                if (isChecked) {
                                  await setPrefs(
                                      usernameController.text.toString(),
                                      passwordController.text.toString());
                                }
                                await setTokens();
                                if (context.mounted) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DashboardPage(userData)));
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        'general error please try again later');
                              }
                            },
                            color: color2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Log In',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: ReusableLine(inputText: 'or'),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          'Log in with Your Face ID',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato'),
                        ),
                      ),
                      const SizedBox(
                        height: 60.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Copyright - Ejada Systems Ltd - 1444 AH 2023',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
