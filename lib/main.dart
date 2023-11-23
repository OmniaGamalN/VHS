import 'package:challene1/Screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LogIn());
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(unselectedWidgetColor: Colors.white),
        home: LoginScreen());
  }
}
