import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReusableBackground extends StatelessWidget {
  const ReusableBackground({
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
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Image(
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
                  const Spacer(
                    flex: 12,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset('images/profileIcon.svg'),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    'images/row.svg',
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
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
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
