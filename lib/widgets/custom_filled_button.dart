import 'package:quick_bank_ui/custom_values.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFilledButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  Color? backgroundColor;
  Color? foregroundColor;

  CustomFilledButton({
    super.key,
    this.onPressed,
    required this.text,
    this.backgroundColor = CustomValues.primaryColor,
    this.foregroundColor = CustomValues.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: const Size(double.infinity, 56),
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      child: Text(text),
    );
  }
}
