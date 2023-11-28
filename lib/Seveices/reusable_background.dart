import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReusableBackground extends StatelessWidget {
  ReusableBackground({
    super.key,
    required this.inputString,
    required this.username,
    required this.formattedDate,
  });
  final String? inputString;
  final String? username;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(top: 0, child: SvgPicture.asset('images/layout.svg')),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: const Image(
                  image: AssetImage('images/ejada_logo.png'),
                  width: 98,
                  height: 32,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  Spacer(
                    flex: 12,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset('images/profileIcon.svg'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    'images/row.svg',
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${inputString!} ${username!}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      fontFamily: 'Bahij'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  formattedDate,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Bahij'),
                ),
              ),
              SizedBox(
                height: 55,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// const Positioned(
// top: 51,
// left: 170,
// child: Image(
// image: AssetImage('images/ejada_logo.png'),
// width: 98,
// height: 32,
// ),
// ),
// Positioned(
// top: 90,
// left: 10,
// child: IconButton(
// icon: const Icon(
// Icons.notifications,
// color: Colors.white,
// size: 40,
// ),
// onPressed: () {},
// ),
// ),
// Positioned(
// top: 150,
// left: 10,
// child: Text(
// '${inputString!} ${username!}',
// style: const TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.w500,
// fontSize: 28,
// fontFamily: 'Bahij'),
// ),
// ),
// Positioned(
// top: 185,
// left: 10,
// child: Text(
// formattedDate,
// style: const TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.w500,
// fontSize: 16,
// fontFamily: 'Bahij'),
// ),
// ),
// Positioned(
// top: 102,
// left: 335,
// child: GestureDetector(
// onTap: () {}, child: SvgPicture.asset('images/profileIcon.svg')),
// ),
// Positioned(
// top: 102,
// left: 370,
// child: SvgPicture.asset(
// 'images/row.svg',
// ),
// ),
