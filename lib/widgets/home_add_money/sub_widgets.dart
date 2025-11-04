import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_back_button.dart';
import 'package:quick_bank_ui/widgets/custom_filled_button.dart';
import 'package:quick_bank_ui/widgets/custom_input.dart';
import 'package:quick_bank_ui/widgets/custom_title.dart';
import 'package:quick_bank_ui/widgets/custom_transaction_tile.dart';
import 'package:quick_bank_ui/widgets/home/sub_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
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
      toolbarHeight: 74,
      floating: false,
      automaticallyImplyLeading: false,
      title: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [CustomBackButton(context: context)],
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(child: CustomTitle(text: "Add money")),
          ),
        ],
      ),
      titleSpacing: 0,
    );
  }
}

class BuildSelectCard extends StatefulWidget {
  const BuildSelectCard({super.key});

  @override
  State<BuildSelectCard> createState() => BuildSelectCardState();
}

class BuildSelectCardState extends State<BuildSelectCard> {
  String radioValue = "masterCard";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: CustomValues.spacing / 2,
      children: [
        CustomTitle(text: "Select card"),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CustomSelectableCard(
                radioValue: "masterCard",
                radioGroupValue: radioValue,
                onCardSelected: (value) => setState(() => radioValue = value),
              ),
              CustomSelectableCard(
                radioValue: "visaCard",
                radioGroupValue: radioValue,
                onCardSelected: (value) => setState(() => radioValue = value),
                cardNumber: "....7845",
                type: CardType.visaCard,
              ),
              CustomSelectableCard(
                radioValue: "americanExpressCard",
                radioGroupValue: radioValue,
                onCardSelected: (value) => setState(() => radioValue = value),
                cardNumber: "....6894",
                type: CardType.americanExpressCard,
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomSelectableCard extends StatefulWidget {
  bool isLast;
  final String radioValue;
  String radioGroupValue;
  CardType type;
  String cardNumber;
  void Function(String)? onCardSelected;
  bool? hideNumber;

  CustomSelectableCard({
    super.key,
    this.isLast = false,
    required this.radioValue,
    required this.radioGroupValue,
    this.type = CardType.masterCard,
    this.cardNumber = "....4568",
    this.onCardSelected,
    this.hideNumber = false,
  });

  @override
  State<CustomSelectableCard> createState() => CustomSelectableCardState();
}

class CustomSelectableCardState extends State<CustomSelectableCard> {
  bool get isSelected => widget.radioValue == widget.radioGroupValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => widget.onCardSelected?.call(widget.radioValue),
          child: AspectRatio(
            aspectRatio: 1.0 / 1.0,
            child: Container(
              padding: EdgeInsets.all(CustomValues.spacing / 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomValues.spacing),
                border: Border.all(
                  width: 2.5,
                  color: CustomValues.foregroundColor.withValues(
                    alpha: isSelected ? 1 : 0.1,
                  ),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(CustomValues.spacing / 1.5),
                decoration: BoxDecoration(
                  color: widget.type == CardType.masterCard
                      ? CustomValues.primaryColor
                      : widget.type == CardType.visaCard
                      ? CustomValues.foregroundColor.withValues(alpha: 0.1)
                      : CustomValues.primaryColor.withValues(alpha: 0.4),
                  border: Border.all(
                    width: .5,
                    color: CustomValues.foregroundColor.withValues(alpha: 0.1),
                  ),
                  borderRadius: BorderRadius.circular(
                    CustomValues.spacing - (CustomValues.spacing / 3),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 1.4,
                          child: Radio(
                            value: widget.radioValue,
                            groupValue: widget.radioGroupValue,
                            fillColor: WidgetStatePropertyAll(
                              isSelected
                                  ? CustomValues.foregroundColor
                                  : CustomValues.foregroundColor.withValues(
                                      alpha: 0.4,
                                    ),
                            ),
                            onChanged: (value) =>
                                widget.onCardSelected?.call(value!),
                          ),
                        ),
                        Iconify(
                          widget.type == CardType.masterCard
                              ? CustomValues.masterCardIcon
                              : widget.type == CardType.visaCard
                              ? CustomValues.visaCardIcon
                              : CustomValues.americanExpressCardIcon,
                          size: 28,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          spacing: 2,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Debit Card",
                              style: TextStyle(
                                fontSize: CustomValues.textFontSize,
                                height: 1.1,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0,
                                color: CustomValues.foregroundColor.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                            widget.hideNumber == false
                                ? Text(
                                    widget.cardNumber,
                                    style: TextStyle(
                                      fontSize:
                                          CustomValues.titleFontSize / 1.5,
                                      height: 1.2,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0,
                                      color: CustomValues.foregroundColor
                                          .withValues(alpha: 0.8),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: widget.isLast ? 0 : CustomValues.spacing / 1.5),
      ],
    );
  }
}

class BuildAddMoneyMethods extends StatefulWidget {
  const BuildAddMoneyMethods({super.key});

  @override
  State<BuildAddMoneyMethods> createState() => BuildAddMoneyMethodsState();
}

class BuildAddMoneyMethodsState extends State<BuildAddMoneyMethods> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: CustomValues.spacing / 2,
      children: [
        CustomTitle(text: "Add money via"),
        Column(
          spacing: CustomValues.spacing / 2,
          children: [
            CustomTransactionTile(
              leftIcon: Iconify(CustomValues.shareIcon),
              name: "Send payment link",
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
                              CustomValues.shareIcon,
                              color: CustomValues.foregroundColor,
                              size: CustomValues.spacing * 2.2,
                            ),
                            Text(
                              "Share payment link with your friends!",
                              style: CustomInput.titleStyle,
                            ),
                            CustomFilledButton(
                              text: "Copy Link",
                              onPressed: () {
                                Navigator.pop(ctx);
                                SnackBar snackBar = SnackBar(
                                  content: Text("Link copied!"),
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
              leftIcon: Iconify(CustomValues.arrowDownUpIcon),
              name: "Transfer from other banks",
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
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/imgs/sample-qr.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              "Receive payment by this QR code.",
                              style: CustomInput.titleStyle,
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
              leftIcon: Iconify(CustomValues.appleOutlinedIcon),
              name: "Apple Pay",
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
          ],
        ),
      ],
    );
  }
}
