import 'package:flutter/material.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_padding.dart';
import 'package:quick_bank_ui/widgets/profile/sub_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      children: [
        BuildAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: CustomValues.spacing / 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: CustomValues.spacing,
              children: [BuildProfilePhoto(), BuildPersonalInfo()],
            ),
            SizedBox(height: CustomValues.spacing),
          ]),
        ),
      ],
    );
  }
}
