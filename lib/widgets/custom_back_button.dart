import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_icon_wrapper.dart';

class CustomBackButton extends StatelessWidget {
  final BuildContext context;
  const CustomBackButton({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return CustomIconWrapper(
      child: IconButton(
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onPressed: () => Navigator.pop(context),
        icon: Iconify(CustomValues.chevronLeftIcon),
      ),
    );
  }
}
