import 'package:quick_bank_ui/custom_values.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Widget child;
  const CustomCard({super.key, required this.child});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomValues.backgroundColor,
        border: Border.all(
          width: 0.5,
          color: CustomValues.foregroundColor.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.circular(CustomValues.spacing),
      ),
      padding: EdgeInsets.all(CustomValues.spacing),
      child: widget.child,
    );
  }
}
