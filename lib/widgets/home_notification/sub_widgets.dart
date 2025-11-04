import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_back_button.dart';
import 'package:quick_bank_ui/widgets/custom_title.dart';

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
            child: Center(child: CustomTitle(text: "Notification")),
          ),
        ],
      ),
      titleSpacing: 0,
    );
  }
}

class BuildEmptyNotification extends StatefulWidget {
  const BuildEmptyNotification({super.key});

  @override
  State<BuildEmptyNotification> createState() => BuildEmptyNotificationState();
}

class BuildEmptyNotificationState extends State<BuildEmptyNotification> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: CustomValues.spacing,
        children: [
          Iconify(
            CustomValues.bellIcon,
            color: CustomValues.foregroundColor.withValues(alpha: 0.3),
            size: CustomValues.spacing * 4,
          ),
          Text("No notifications yet!"),
        ],
      ),
    );
  }
}
