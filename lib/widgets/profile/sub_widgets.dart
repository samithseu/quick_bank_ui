import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_card.dart';
import 'package:quick_bank_ui/widgets/custom_filled_button.dart';
import 'package:quick_bank_ui/widgets/custom_icon_wrapper.dart';
import 'package:quick_bank_ui/widgets/custom_info_tile.dart';
import 'package:quick_bank_ui/widgets/custom_title.dart';
import 'package:quick_bank_ui/widgets/custom_title_label.dart';
import 'package:quick_bank_ui/widgets/utils.dart';

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
      toolbarHeight: 45,
      floating: false,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [CustomTitle(text: "Profile")],
      ),
      titleSpacing: 0,
    );
  }
}

class BuildProfilePhoto extends StatefulWidget {
  const BuildProfilePhoto({super.key});

  @override
  State<BuildProfilePhoto> createState() => BuildProfilePhotoState();
}

class BuildProfilePhotoState extends State<BuildProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: CustomValues.spacing * 5,
            height: CustomValues.spacing * 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                  "https://avatars.githubusercontent.com/u/59063392?v=4",
                ),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: CustomValues.backgroundColor, width: 4),
            ),
          ),
          // edit icon
          Positioned(
            bottom: -5,
            right: -5,
            child: Transform.scale(
              scale: .8,
              child: CustomIconWrapper(
                color: CustomValues.primaryColor,
                child: IconButton(
                  onPressed: () {
                    customBottomSheet(
                      context: context,
                      builder: (BuildContext ctx) {
                        return SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 0,
                              bottom: CustomValues.spacing,
                              left: CustomValues.spacing,
                              right: CustomValues.spacing,
                            ),
                            child: Column(
                              spacing: CustomValues.spacing,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomFilledButton(
                                  text: "Take Photo",
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                    SnackBar snackBar = SnackBar(
                                      content: Text("Opened Camera!"),
                                      backgroundColor:
                                          CustomValues.foregroundColor,
                                      duration: Duration(milliseconds: 1500),
                                    );
                                    ScaffoldMessenger.of(
                                      ctx,
                                    ).showSnackBar(snackBar);
                                  },
                                ),
                                CustomFilledButton(
                                  text: "Choose Photo",
                                  backgroundColor: CustomValues.foregroundColor,
                                  foregroundColor: CustomValues.primaryColor,
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                    SnackBar snackBar = SnackBar(
                                      content: Text("Opened Gallery!"),
                                      backgroundColor:
                                          CustomValues.foregroundColor,
                                      duration: Duration(milliseconds: 1500),
                                    );
                                    ScaffoldMessenger.of(
                                      ctx,
                                    ).showSnackBar(snackBar);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Iconify(CustomValues.editIcon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildPersonalInfo extends StatefulWidget {
  const BuildPersonalInfo({super.key});

  @override
  State<BuildPersonalInfo> createState() => BuildPersonalInfoState();
}

class BuildPersonalInfoState extends State<BuildPersonalInfo> {
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
              CustomTitle(text: "Personal info"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                  visualDensity: VisualDensity.compact,
                  elevation: 0,
                ),
                onPressed: () {},
                child: CustomTitleLabel(text: "Edit"),
              ),
            ],
          ),
          Column(
            spacing: CustomValues.spacing / 1.5,
            children: [
              CustomInfoTile(
                icon: Iconify(CustomValues.userRoundIcon),
                title: "Name",
                subtitle: "Samith Seu",
              ),
              CustomInfoTile(
                icon: Iconify(CustomValues.emailIcon),
                title: "E-mail",
                subtitle: "samithseu@gmail.com",
              ),
              CustomInfoTile(
                icon: Iconify(CustomValues.phoneIcon),
                title: "Phone number",
                subtitle: "(855) 0123 123 123",
              ),
              CustomInfoTile(
                icon: Iconify(CustomValues.homeIcon),
                title: "Home address",
                subtitle: "0123, Kampong Speu",
              ),
              CustomInfoTile(
                icon: Iconify(CustomValues.userRoundPenIcon),
                title: "Career",
                subtitle: "Frontend Dev",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
