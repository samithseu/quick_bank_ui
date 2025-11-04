import 'package:quick_bank_ui/custom_values.dart';
import 'package:flutter/material.dart';

class CustomPadding extends StatefulWidget {
  final List<Widget> children;
  const CustomPadding({super.key, required this.children});

  @override
  State<CustomPadding> createState() => _CustomPaddingState();
}

class _CustomPaddingState extends State<CustomPadding> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: CustomValues.spacing * 2,
        left: CustomValues.spacing,
        right: CustomValues.spacing,
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: CustomScrollView(slivers: widget.children),
      ),
    );
  }
}
