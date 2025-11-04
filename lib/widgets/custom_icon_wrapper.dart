import 'package:quick_bank_ui/custom_values.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconWrapper extends StatelessWidget {
  final Widget child;
  Color? color;

  CustomIconWrapper({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CustomValues.spacing * 1.8,
      height: CustomValues.spacing * 1.8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: CustomValues.foregroundColor.withValues(alpha: 0.2),
        ),
      ),
      child: child,
    );
  }
}
