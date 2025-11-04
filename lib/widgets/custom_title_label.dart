import 'package:quick_bank_ui/custom_values.dart';
import 'package:flutter/material.dart';

class CustomTitleLabel extends StatelessWidget {
  final String text;
  const CustomTitleLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: CustomValues.textFontSize,
        height: 1.4,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: CustomValues.foregroundColor,
      ),
    );
  }
}
