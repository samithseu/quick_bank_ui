import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:quick_bank_ui/custom_values.dart';

// ignore: must_be_immutable
class CustomTransactionTile extends StatefulWidget {
  final Widget leftIcon;
  final String name;
  Widget? subName;
  Widget? rightIcon;
  void Function()? onTap;

  static TextStyle subNameStyle = TextStyle(
    fontSize: CustomValues.textFontSize - 2,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.15,
    color: CustomValues.foregroundColor.withValues(alpha: 0.65),
  );

  CustomTransactionTile({
    super.key,
    required this.leftIcon,
    required this.name,
    this.subName,
    this.rightIcon = const Iconify(CustomValues.chevronRightIcon),
    this.onTap,
  });

  @override
  State<CustomTransactionTile> createState() => _CustomTransactionTileState();
}

class _CustomTransactionTileState extends State<CustomTransactionTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: CustomValues.spacing / 1,
          horizontal: CustomValues.spacing / 1.2,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: CustomValues.foregroundColor.withValues(alpha: 0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: CustomValues.foregroundColor.withValues(alpha: 0.02),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
          color: CustomValues.backgroundColor,
          borderRadius: BorderRadius.circular(CustomValues.spacing / 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: CustomValues.spacing / 2,
              children: [
                widget.leftIcon,
                widget.subName != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: CustomValues.spacing / 8,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: CustomValues.textFontSize,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.15,
                              color: CustomValues.foregroundColor.withValues(
                                alpha: 0.8,
                              ),
                            ),
                          ),
                          widget.subName!,
                        ],
                      )
                    : Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: CustomValues.textFontSize,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.15,
                          color: CustomValues.foregroundColor.withValues(
                            alpha: 0.8,
                          ),
                        ),
                      ),
              ],
            ),
            Container(child: widget.rightIcon),
          ],
        ),
      ),
    );
  }
}
