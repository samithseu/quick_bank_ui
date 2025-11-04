import 'package:flutter/material.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/transaction_card.dart';

class CustomInfoTile extends StatefulWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  const CustomInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  State<CustomInfoTile> createState() => _CustomInfoTileState();
}

class _CustomInfoTileState extends State<CustomInfoTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: CustomValues.spacing / 1.4,
        children: [
          widget.icon,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: CustomValues.spacing / 5,
              children: [
                Text(widget.title, style: TransactionCard.timeTextStyle),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: CustomValues.textFontSize + 1,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                    color: CustomValues.foregroundColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
