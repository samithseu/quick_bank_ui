import 'dart:ui';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/screens/home_add_card_screen.dart';
import 'package:quick_bank_ui/screens/home_add_money_screen.dart';
import 'package:quick_bank_ui/screens/home_notification.dart';
import 'package:quick_bank_ui/screens/home_transactions_screen.dart';
import 'package:quick_bank_ui/widgets/custom_card.dart';
import 'package:quick_bank_ui/widgets/custom_filled_button.dart';
import 'package:quick_bank_ui/widgets/custom_icon_wrapper.dart';
import 'package:quick_bank_ui/widgets/custom_title.dart';
import 'package:quick_bank_ui/widgets/custom_title_label.dart';
import 'package:quick_bank_ui/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: CustomValues.secondaryColor,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      toolbarHeight: 74,
      floating: false,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              CustomTitle(text: "Hi, Samith!"),
              Text(
                "Welcome to QuickBank!",
                style: TextStyle(
                  fontSize: CustomValues.textFontSize,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                  color: CustomValues.foregroundColor.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
          CustomIconWrapper(
            child: IconButton(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeNotification()),
              ),
              icon: Iconify(CustomValues.bellIcon),
            ),
          ),
        ],
      ),
      titleSpacing: 0,
    );
  }
}

// balance -----------------------------
class BuildBalance extends StatefulWidget {
  const BuildBalance({super.key});

  @override
  State<BuildBalance> createState() => _BuildBalanceState();
}

class _BuildBalanceState extends State<BuildBalance> {
  late bool isEyeOn = false;
  late double sigmaValue = 14.0;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        spacing: CustomValues.spacing / 1.5,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your balance",
                    style: TextStyle(
                      fontSize: CustomValues.textFontSize,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0,
                      color: CustomValues.foregroundColor.withValues(
                        alpha: 0.8,
                      ),
                    ),
                  ),
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: isEyeOn ? sigmaValue : 0.0,
                      sigmaY: isEyeOn ? sigmaValue : 0.0,
                    ),
                    child: Text(
                      "\$3,200.00",
                      style: TextStyle(
                        fontSize: CustomValues.spacing * 1.2,
                        height: 1,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                        color: CustomValues.foregroundColor,
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => setState(() => isEyeOn = !isEyeOn),
                icon: Iconify(
                  isEyeOn ? CustomValues.eyeOnIcon : CustomValues.eyeOffIcon,
                ),
              ),
            ],
          ),
          CustomFilledButton(
            text: "Add money",
            backgroundColor: CustomValues.foregroundColor,
            foregroundColor: CustomValues.primaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeAddMoneyScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// cards -----------------------------
class BuildCards extends StatefulWidget {
  const BuildCards({super.key});

  @override
  State<BuildCards> createState() => _BuildCardsState();
}

class _BuildCardsState extends State<BuildCards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: CustomValues.spacing / 2,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTitle(text: "Your cards"),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                overlayColor: Colors.transparent,
                visualDensity: VisualDensity.compact,
                elevation: 0,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeAddCardScreen()),
              ),
              icon: Iconify(CustomValues.addIcon, size: 20),
              label: CustomTitleLabel(text: "Card"),
            ),
          ],
        ),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _EachCarouselCard(),
              _EachCarouselCard(
                cardNumber: "xxxx xxxx xxxx 7845",
                type: CardType.visaCard,
              ),
              _EachCarouselCard(
                cardNumber: "xxxx xxxx xxxx 6894",
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

// each card -----------------------------
enum CardType { masterCard, visaCard, americanExpressCard }

// ignore: must_be_immutable
class _EachCarouselCard extends StatefulWidget {
  bool isLast;
  CardType type;
  String cardNumber;

  _EachCarouselCard({
    this.isLast = false,
    this.type = CardType.masterCard,
    this.cardNumber = "xxxx xxxx xxxx 4568",
  });

  @override
  State<_EachCarouselCard> createState() => __EachCarouselCardState();
}

class __EachCarouselCardState extends State<_EachCarouselCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AspectRatio(
          aspectRatio: 3.37 / 2,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: widget.type == CardType.masterCard
                  ? CustomValues.primaryColor
                  : widget.type == CardType.visaCard
                  ? CustomValues.foregroundColor.withValues(alpha: 0.1)
                  : CustomValues.primaryColor.withValues(alpha: 0.4),
              border: Border.all(
                width: 0.5,
                color: CustomValues.foregroundColor.withValues(alpha: 0.1),
              ),
              borderRadius: BorderRadius.circular(CustomValues.spacing),
            ),
            child: Padding(
              padding: EdgeInsets.all(CustomValues.spacing),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTitle(text: "QB."),
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
                          Text(
                            widget.cardNumber,
                            style: TextStyle(
                              fontSize: CustomValues.titleFontSize / 1.5,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0,
                              color: CustomValues.foregroundColor.withValues(
                                alpha: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: widget.isLast ? 0 : CustomValues.spacing / 1.5),
      ],
    );
  }
}

// transactions -----------------------------
class BuildTransactions extends StatefulWidget {
  const BuildTransactions({super.key});

  @override
  State<BuildTransactions> createState() => _BuildTransactionsState();
}

class _BuildTransactionsState extends State<BuildTransactions> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        spacing: CustomValues.spacing / 2,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(text: "Transactions"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                  visualDensity: VisualDensity.compact,
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeTransactionsScreen(),
                    ),
                  );
                },
                child: CustomTitleLabel(text: "See all"),
              ),
            ],
          ),
          Column(
            spacing: CustomValues.spacing / 2,
            children: [
              TransactionCard(
                name: "Breakfast",
                time: "Oct 17, 07:35 AM",
                amount: "3.00",
                badge: "New",
              ),
              TransactionCard(
                name: "Juice",
                time: "Oct 17, 09:00 AM",
                amount: "4.00",
                badge: "New",
              ),
              TransactionCard(
                name: "Coffee",
                time: "Oct 17, 02:00 PM",
                amount: "4.00",
                isLast: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
