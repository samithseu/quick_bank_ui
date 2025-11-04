import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_scaffold.dart';
import 'package:quick_bank_ui/widgets/home_add_money/sub_widgets.dart';
import 'package:flutter/material.dart';

class HomeAddMoneyScreen extends StatefulWidget {
  const HomeAddMoneyScreen({super.key});

  @override
  State<HomeAddMoneyScreen> createState() => HomeAddMoneyScreenState();
}

class HomeAddMoneyScreenState extends State<HomeAddMoneyScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [BuildSelectCard(), BuildAddMoneyMethods()],
            ),
            SizedBox(height: CustomValues.spacing),
          ]),
        ),
      ],
    );
  }
}
