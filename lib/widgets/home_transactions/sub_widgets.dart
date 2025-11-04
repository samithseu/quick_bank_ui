import 'package:flutter/material.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_back_button.dart';
import 'package:quick_bank_ui/widgets/custom_card.dart';
import 'package:quick_bank_ui/widgets/custom_title.dart';
import 'package:quick_bank_ui/widgets/transaction_card.dart';

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
            child: Center(child: CustomTitle(text: "Transactions")),
          ),
        ],
      ),
      titleSpacing: 0,
    );
  }
}

class BuildTransactionCards extends StatefulWidget {
  const BuildTransactionCards({super.key});

  @override
  State<BuildTransactionCards> createState() => _BuildTransactionCardsState();
}

class _BuildTransactionCardsState extends State<BuildTransactionCards> {
  final List<Map<String, dynamic>> transactions = [
    {
      "date": "Oct 17, Thu",
      "expenses": [
        {"name": "Breakfast", "time": "07:35 AM", "amount": 3, "badge": "New"},
        {"name": "Juice", "time": "09:00 AM", "amount": 4, "badge": "New"},
        {"name": "Coffee", "time": "02:00 PM", "amount": 4, "badge": null},
      ],
    },
    {
      "date": "Oct 16, Wed",
      "expenses": [
        {"name": "Breakfast", "time": "07:24 AM", "amount": 3, "badge": "Old"},
        {"name": "Juice", "time": "08:54 AM", "amount": 4, "badge": "Old"},
        {"name": "Coffee", "time": "02:05 PM", "amount": 4, "badge": "Old"},
      ],
    },
    {
      "date": "Oct 15, Tue",
      "expenses": [
        {"name": "Breakfast", "time": "07:16 AM", "amount": 3, "badge": "Old"},
        {
          "name": "Juice & Coffee",
          "time": "08:50 AM",
          "amount": 5,
          "badge": "Old",
        },
        {"name": "Coffee", "time": "02:00 PM", "amount": 2, "badge": "Old"},
        {"name": "Pub", "time": "08:25 PM", "amount": 20, "badge": "Old"},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: CustomValues.spacing,
      children: transactions.map((transaction) {
        final expensesList = (transaction["expenses"] as List<dynamic>)
            .cast<Map<String, dynamic>>();
        double total = expensesList.fold(0.0, (sum, item) {
          double amount = (item['amount'] as num?)?.toDouble() ?? 0.0;
          return sum + amount;
        });
        return CustomCard(
          child: Column(
            spacing: CustomValues.spacing,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text("Date", style: TransactionCard.timeTextStyle),
                      Text(
                        transaction["date"] ?? '',
                        style: TransactionCard.nameTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 8,
                    children: [
                      Text("Total", style: TransactionCard.timeTextStyle),
                      Text(
                        "-\$${total.toStringAsFixed(2)}",
                        style: TransactionCard.amountTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                spacing: CustomValues.spacing / 2,
                children: expensesList.asMap().entries.map<Widget>((entry) {
                  final index = entry.key;
                  final expense = entry.value;
                  return TransactionCard(
                    name: expense["name"],
                    time: expense["time"],
                    amount: "${expense["amount"].toStringAsFixed(2)}",
                    badge: expense["badge"],
                    isLast: index == expensesList.length - 1,
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
