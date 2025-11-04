import 'package:flutter/material.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_scaffold.dart';
import 'package:quick_bank_ui/widgets/home_transactions/sub_widgets.dart';

class HomeTransactionsScreen extends StatefulWidget {
  const HomeTransactionsScreen({super.key});

  @override
  State<HomeTransactionsScreen> createState() => _HomeTransactionsScreenState();
}

class _HomeTransactionsScreenState extends State<HomeTransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      children: [
        BuildAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: CustomValues.spacing / 2),
            Column(
              spacing: CustomValues.spacing,
              children: [BuildTransactionCards()],
            ),
            SizedBox(height: CustomValues.spacing),
          ]),
        ),
      ],
    );
  }
}
