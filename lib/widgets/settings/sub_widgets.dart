import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_title.dart';
import 'package:quick_bank_ui/widgets/custom_transaction_tile.dart';

class BuildAppBar extends StatefulWidget {
  const BuildAppBar({super.key});

  @override
  State<BuildAppBar> createState() => _BuildAppBarState();
}

class _BuildAppBarState extends State<BuildAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: CustomValues.secondaryColor,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      toolbarHeight: 45,
      floating: false,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [CustomTitle(text: "Settings")],
      ),
      titleSpacing: 0,
    );
  }
}

class BuildSettingsOptions extends StatefulWidget {
  const BuildSettingsOptions({super.key});

  @override
  State<BuildSettingsOptions> createState() => BuildSettingsOptionsState();
}

class BuildSettingsOptionsState extends State<BuildSettingsOptions> {
  late bool allowTransaction = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: CustomValues.spacing / 2,
      children: [
        Text(
          "Card Settings",
          style: TextStyle(
            fontSize: CustomValues.titleFontSize - 10,
            height: 1.4,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
            color: CustomValues.foregroundColor.withValues(alpha: 0.6),
          ),
        ),
        Column(
          spacing: CustomValues.spacing / 2,
          children: [
            CustomTransactionTile(
              leftIcon: Iconify(CustomValues.arrowDownUpIcon),
              rightIcon: Transform.scale(
                scale: 1,
                child: CupertinoSwitch(
                  activeTrackColor: CustomValues.primaryColor,
                  value: allowTransaction,
                  onChanged: (value) {
                    setState(() => allowTransaction = value);
                  },
                ),
              ),
              name: "Allow transaction",
              subName: Text(
                "Transaction are allowed",
                style: CustomTransactionTile.subNameStyle,
              ),
              onTap: () {},
            ),
            CustomTransactionTile(
              leftIcon: Iconify(CustomValues.eyeOnIcon),
              name: "View your pin",
              onTap: () {},
            ),
            CustomTransactionTile(
              leftIcon: Iconify(CustomValues.lockIcon),
              name: "Change your pin",
              onTap: () {},
            ),
            CustomTransactionTile(
              leftIcon: Iconify(CustomValues.outlinedCardIcon),
              name: "Replace your card",
              subName: Text(
                "Card was lost, stolen/damanged",
                style: CustomTransactionTile.subNameStyle,
              ),
              onTap: () {},
            ),
            CustomTransactionTile(
              leftIcon: Iconify(CustomValues.appleOutlinedIcon),
              name: "Connect Apple Pay",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
