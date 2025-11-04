import 'package:flutter/material.dart';
import 'package:quick_bank_ui/custom_values.dart';

Future<void> customBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) async {
  return showModalBottomSheet(
    showDragHandle: true,
    context: context,
    sheetAnimationStyle: AnimationStyle(curve: Curves.easeInOut),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.only(
        topLeft: Radius.circular(CustomValues.spacing),
        topRight: Radius.circular(CustomValues.spacing),
      ),
    ),
    builder: builder,
  );
}
