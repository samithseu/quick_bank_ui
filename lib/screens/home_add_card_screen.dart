import 'package:flutter/material.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_scaffold.dart';
import 'package:quick_bank_ui/widgets/home_add_card/sub_widgets.dart';

class HomeAddCardScreen extends StatefulWidget {
  const HomeAddCardScreen({super.key});

  @override
  State<HomeAddCardScreen> createState() => _HomeAddCardScreenState();
}

class _HomeAddCardScreenState extends State<HomeAddCardScreen> {
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
              children: [BuildAddCardForm()],
            ),
            SizedBox(height: CustomValues.spacing),
          ]),
        ),
      ],
    );
  }
}
