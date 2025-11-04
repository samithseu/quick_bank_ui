import 'package:flutter/material.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_padding.dart';

class CustomScaffold extends StatelessWidget {
  final List<Widget> children;
  const CustomScaffold({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomValues.secondaryColor,
      body: CustomPadding(children: children),
    );
  }
}
