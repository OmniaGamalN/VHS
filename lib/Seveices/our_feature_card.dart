import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constent.dart';

class OurFeatureCard extends StatelessWidget {
  const OurFeatureCard({
    super.key,
    required this.featureCardColor,
    required this.featureCardTitle,
    required this.featureList,
    required this.icon,
  });

  final Color featureCardColor;
  final String? featureCardTitle;
  final List<String> featureList;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 390,
          height: 210,
          child: Card(
            elevation: 5,
            color: featureCardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const Positioned(
          top: 5,
          left: 5.5,
          child: Image(
            image: AssetImage('images/back.png'),
          ),
        ),
        Positioned(
          top: 60,
          left: 20,
          child: SvgPicture.asset('images/lines.svg'),
        ),
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Text(
                featureCardTitle!,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Bahij',
                    fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0, top: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Image(
                        image: AssetImage('images/$icon.png'),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: ListView.builder(
                        //shrinkWrap: true,
                        itemCount: featureList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SvgPicture.asset(
                                        'images/Ellipse2.svg')),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    featureList[index],
                                    style: kFeatureList,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
