import 'package:flutter/material.dart';

class ReusableLine extends StatelessWidget {
  final String inputText;
  const ReusableLine({super.key, required this.inputText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: ReusableContainer(),
        ),
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.0),
          ),
          child: Text(
            inputText,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const Expanded(child: ReusableContainer()),
      ],
    );
  }
}

class ReusableContainer extends StatelessWidget {
  const ReusableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      color: Colors.white,
    );
  }
}
