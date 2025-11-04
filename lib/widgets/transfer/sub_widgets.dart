import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_filled_button.dart';
import 'package:quick_bank_ui/widgets/custom_input.dart';
import 'package:quick_bank_ui/widgets/custom_title.dart';
import 'package:quick_bank_ui/widgets/custom_transaction_tile.dart';
import "dart:math" as math;

import 'package:quick_bank_ui/widgets/utils.dart';

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
        children: [CustomTitle(text: "Transfer")],
      ),
      titleSpacing: 0,
    );
  }
}

class BuildTransferOptions extends StatefulWidget {
  const BuildTransferOptions({super.key});

  @override
  State<BuildTransferOptions> createState() => _BuildTransferOptionsState();
}

class _BuildTransferOptionsState extends State<BuildTransferOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: CustomValues.spacing / 2,
      children: [
        Center(
          child: Transform.rotate(
            angle: -math.pi / 2,
            child: Lottie.asset(
              "assets/lottie/download.json",
              width: 140,
              fit: BoxFit.cover,
              frameRate: FrameRate(60),
            ),
          ),
        ),

        Text(
          "Select an option",
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
              name: "Transfer to QuickBank",
              onTap: () {
                customBottomSheet(
                  context: context,
                  builder: (BuildContext ctx) {
                    return SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 0,
                          bottom: CustomValues.spacing,
                          left: CustomValues.spacing,
                          right: CustomValues.spacing,
                        ),
                        child: Column(
                          spacing: CustomValues.spacing,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomInput(
                              title: "Account number",
                              placeholder: "Enter account number...",
                            ),
                            CustomFilledButton(
                              text: "Transfer Now",
                              onPressed: () {
                                Navigator.pop(ctx);
                                SnackBar snackBar = SnackBar(
                                  content: Text("Transfer successfully!"),
                                  backgroundColor: CustomValues.foregroundColor,
                                  duration: Duration(milliseconds: 1500),
                                );
                                ScaffoldMessenger.of(
                                  ctx,
                                ).showSnackBar(snackBar);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            CustomTransactionTile(
              leftIcon: Iconify(CustomValues.shareIcon),
              name: "Transfer to other banks",
              onTap: () {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
              },
            ),
            CustomTransactionTile(
              leftIcon: Iconify(CustomValues.appleOutlinedIcon),
              name: "Send to Apple Pay",
              onTap: () {
                customBottomSheet(
                  context: context,
                  builder: (BuildContext ctx) {
                    return SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 0,
                          bottom: CustomValues.spacing,
                          left: CustomValues.spacing,
                          right: CustomValues.spacing,
                        ),
                        child: Column(
                          spacing: CustomValues.spacing,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Iconify(
                              CustomValues.qrCodeScanIcon,
                              color: CustomValues.foregroundColor,
                              size: 80,
                            ),
                            Text(
                              "App will open camera & scan QR code.",
                              style: CustomInput.titleStyle,
                            ),
                            CustomFilledButton(
                              text: "Scan Now",
                              onPressed: () {
                                Navigator.pop(ctx);
                                SnackBar snackBar = SnackBar(
                                  content: Text("Opened Camera!"),
                                  backgroundColor: CustomValues.foregroundColor,
                                  duration: Duration(milliseconds: 1500),
                                );
                                ScaffoldMessenger.of(
                                  ctx,
                                ).showSnackBar(snackBar);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            CustomTransactionTile(
              leftIcon: Iconify(CustomValues.outlinedCardIcon),
              name: "Debit/Credit Card",
              onTap: () {
                customBottomSheet(
                  context: context,
                  builder: (BuildContext ctx) {
                    return SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 0,
                          bottom: CustomValues.spacing,
                          left: CustomValues.spacing,
                          right: CustomValues.spacing,
                        ),
                        child: Column(
                          spacing: CustomValues.spacing,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomInput(
                              title: "Card number",
                              placeholder: "Enter card number...",
                            ),
                            CustomFilledButton(
                              text: "Transfer Now",
                              onPressed: () {
                                Navigator.pop(ctx);
                                SnackBar snackBar = SnackBar(
                                  content: Text("Transfer successfully!"),
                                  backgroundColor: CustomValues.foregroundColor,
                                  duration: Duration(milliseconds: 1500),
                                );
                                ScaffoldMessenger.of(
                                  ctx,
                                ).showSnackBar(snackBar);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
