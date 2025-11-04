import 'package:flutter/material.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_back_button.dart';
import 'package:quick_bank_ui/widgets/custom_filled_button.dart';
import 'package:quick_bank_ui/widgets/custom_input.dart';
import 'package:quick_bank_ui/widgets/custom_title.dart';
import 'package:quick_bank_ui/widgets/home/sub_widgets.dart';
import 'package:quick_bank_ui/widgets/home_add_money/sub_widgets.dart';

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
            child: Center(child: CustomTitle(text: "Add Card")),
          ),
        ],
      ),
      titleSpacing: 0,
    );
  }
}

class BuildAddCardForm extends StatefulWidget {
  const BuildAddCardForm({super.key});

  @override
  State<BuildAddCardForm> createState() => _BuildAddCardFormState();
}

class _BuildAddCardFormState extends State<BuildAddCardForm> {
  String radioValue = "masterCard";
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: CustomValues.spacing / 2,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: CustomValues.spacing / 2,
          children: [
            CustomTitle(text: "Card type:"),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CustomSelectableCard(
                    radioValue: "masterCard",
                    radioGroupValue: radioValue,
                    onCardSelected: (value) =>
                        setState(() => radioValue = value),
                    hideNumber: true,
                  ),
                  CustomSelectableCard(
                    radioValue: "visaCard",
                    radioGroupValue: radioValue,
                    onCardSelected: (value) =>
                        setState(() => radioValue = value),
                    cardNumber: "....7845",
                    type: CardType.visaCard,
                    hideNumber: true,
                  ),
                  CustomSelectableCard(
                    radioValue: "americanExpressCard",
                    radioGroupValue: radioValue,
                    onCardSelected: (value) =>
                        setState(() => radioValue = value),
                    cardNumber: "....6894",
                    type: CardType.americanExpressCard,
                    hideNumber: true,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ],
        ),
        CustomInput(title: "E-mail", placeholder: "Enter email..."),
        CustomInput(
          title: "Phone number",
          placeholder: "Enter phone number...",
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: CustomValues.spacing / 8,
          children: [
            Checkbox(
              activeColor: CustomValues.foregroundColor,
              checkColor: CustomValues.primaryColor,
              value: agree,
              onChanged: (value) => setState(() => agree = !agree),
            ),
            GestureDetector(
              onTap: () => setState(() => agree = !agree),
              child: Text(
                "Agree to terms and conditions!",
                style: CustomInput.titleStyle,
              ),
            ),
          ],
        ),
        CustomFilledButton(
          backgroundColor: CustomValues.foregroundColor,
          foregroundColor: CustomValues.primaryColor,
          text: "Add new card!",
          onPressed: () {
            Navigator.pop(context);
            SnackBar snackBar = SnackBar(
              content: Text("Card added!"),
              backgroundColor: CustomValues.foregroundColor,
              duration: Duration(milliseconds: 1500),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ],
    );
  }
}
