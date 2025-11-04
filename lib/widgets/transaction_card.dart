import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_icon_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

// ignore: must_be_immutable
class TransactionCard extends StatefulWidget {
  final String name;
  final String time;
  final String amount;
  String? badge;
  bool isLast;
  static const TextStyle nameTextStyle = TextStyle(
    height: 1,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle timeTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: CustomValues.foregroundColor.withValues(alpha: 0.5),
  );

  static const TextStyle amountTextStyle = TextStyle(
    height: 1,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle badgeTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: CustomValues.foregroundColor,
  );

  TransactionCard({
    super.key,
    required this.name,
    required this.time,
    required this.amount,
    this.badge,
    this.isLast = false,
  });

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // icon
        CustomIconWrapper(
          child: Iconify(
            CustomValues.imageIcon,
            color: CustomValues.foregroundColor.withValues(alpha: 0.3),
          ),
        ),
        // information
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              bottom: widget.isLast ? 0 : CustomValues.spacing / 2,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: widget.isLast
                    ? BorderSide.none
                    : BorderSide(
                        color: CustomValues.foregroundColor.withValues(
                          alpha: 0.2,
                        ),
                        width: 1,
                      ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name, style: TransactionCard.nameTextStyle),
                    Text(widget.time, style: TransactionCard.timeTextStyle),
                  ],
                ),
                Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "-\$${widget.amount}",
                      style: TransactionCard.amountTextStyle,
                    ),
                    widget.badge != null
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: CustomValues.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              widget.badge!,
                              style: TransactionCard.badgeTextStyle,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
