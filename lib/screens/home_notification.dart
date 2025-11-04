import 'package:flutter/material.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_scaffold.dart';
import 'package:quick_bank_ui/widgets/home_notification/sub_widgets.dart';

class HomeNotification extends StatefulWidget {
  const HomeNotification({super.key});

  @override
  State<HomeNotification> createState() => _HomeNotificationState();
}

class _HomeNotificationState extends State<HomeNotification> {
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
              children: [BuildEmptyNotification()],
            ),
            SizedBox(height: CustomValues.spacing),
          ]),
        ),
      ],
    );
  }
}
