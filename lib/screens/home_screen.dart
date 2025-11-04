import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_padding.dart';
import 'package:quick_bank_ui/widgets/home/sub_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      children: [
        BuildAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: CustomValues.spacing / 2),
            Column(
              spacing: CustomValues.spacing,
              children: [BuildBalance(), BuildCards(), BuildTransactions()],
            ),
            SizedBox(height: CustomValues.spacing),
          ]),
        ),
      ],
    );
  }
}
