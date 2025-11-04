import 'package:quick_bank_ui/custom_values.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

enum CustomInputType { text, password, imagePicker }

class CustomInput extends StatefulWidget {
  final String title;
  final String placeholder;
  final CustomInputType? type;

  const CustomInput({
    super.key,
    required this.title,
    required this.placeholder,
    this.type = CustomInputType.text,
  });

  static const TextStyle titleStyle = TextStyle(
    fontSize: CustomValues.textFontSize,
    height: 1.4,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    color: CustomValues.foregroundColor,
  );

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(widget.title, style: CustomInput.titleStyle),
        widget.type == CustomInputType.text
            ? TextType(placeholder: widget.placeholder)
            : widget.type == CustomInputType.password
            ? TextType(placeholder: widget.placeholder, isPassword: true)
            : ImagePickerType(placeholder: widget.placeholder),
        // Text(
        //   "Error text!",
        //   style: TextStyle(
        //     fontSize: CustomValues.textFontSize - 1,
        //     height: 1.2,
        //     fontWeight: FontWeight.w400,
        //     letterSpacing: 0,
        //     color: Colors.red[800],
        //   ),
        // ),
      ],
    );
  }
}

// text type
class TextType extends StatefulWidget {
  final bool? isPassword;
  final String placeholder;

  const TextType({
    super.key,
    required this.placeholder,
    this.isPassword = false,
  });

  @override
  State<TextType> createState() => _TextTypeState();
}

class _TextTypeState extends State<TextType> {
  final double _borderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ?? false,
      style: TextStyle(
        fontSize: CustomValues.textFontSize,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3,
        color: CustomValues.foregroundColor,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: CustomValues.backgroundColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
          borderSide: BorderSide(
            color: CustomValues.foregroundColor.withValues(alpha: 0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
          borderSide: BorderSide(
            color: CustomValues.foregroundColor,
            width: 2.0,
          ),
        ),
        hintText: widget.placeholder,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: TextStyle(
          fontSize: CustomValues.textFontSize,
          height: 1.4,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: CustomValues.foregroundColor.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}

// image picker type
class ImagePickerType extends StatefulWidget {
  final String placeholder;

  const ImagePickerType({super.key, required this.placeholder});

  @override
  State<ImagePickerType> createState() => _ImagePickerTypeState();
}

class _ImagePickerTypeState extends State<ImagePickerType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: CustomValues.backgroundColor,
        border: Border.all(
          color: CustomValues.foregroundColor.withValues(alpha: 0.2),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Iconify(CustomValues.uploadIcon, size: CustomValues.spacing * 1.5),
            Text(
              widget.placeholder,
              style: TextStyle(
                fontSize: CustomValues.textFontSize,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                color: CustomValues.foregroundColor.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
