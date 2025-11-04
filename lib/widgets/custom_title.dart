import 'package:quick_bank_ui/custom_values.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  const CustomTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: CustomValues.titleFontSize / 1.3,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
        height: 1,
        color: CustomValues.foregroundColor,
      ),
    );
  }
}
