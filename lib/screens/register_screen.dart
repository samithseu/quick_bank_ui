import 'package:quick_bank_ui/screens/login_screen.dart';

import '../custom_values.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/custom_input.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomValues.secondaryColor,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: CustomValues.spacing,
          vertical: CustomValues.spacing * 2,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              CustomValues.primaryColor.withValues(alpha: 0.1),
              Colors.transparent,
              CustomValues.primaryColor.withValues(alpha: 0.01),
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: CustomValues.secondaryColor,
              surfaceTintColor: Colors.transparent,
              pinned: true,
              toolbarHeight: 72,
              floating: false,
              automaticallyImplyLeading: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: CustomValues.titleFontSize,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.4,
                      height: 1.25,
                      color: CustomValues.foregroundColor,
                    ),
                  ),
                  Text(
                    "A few quick things to get started",
                    style: TextStyle(
                      fontSize: CustomValues.textFontSize,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0,
                      color: CustomValues.foregroundColor.withValues(
                        alpha: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
              titleSpacing: 0,
            ),

            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: CustomValues.spacing),
                Column(
                  spacing: CustomValues.spacing - 10,
                  children: [
                    CustomInput(
                      title: "First Name",
                      placeholder: "Enter first name...",
                    ),
                    CustomInput(
                      title: "Last Name",
                      placeholder: "Enter last name...",
                    ),
                    CustomInput(title: "Phone", placeholder: "Enter phone..."),
                    CustomInput(title: "Email", placeholder: "Enter email..."),
                    CustomInput(
                      title: "ID Photo",
                      placeholder: "Please provide your ID photo...",
                      type: CustomInputType.imagePicker,
                    ),
                  ],
                ),
                const SizedBox(height: CustomValues.spacing),
                CustomFilledButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/widget_tree');
                  },
                  text: "Register Now!",
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account?",
                      style: TextStyle(
                        fontSize: CustomValues.textFontSize,
                        height: 1.2,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                        color: CustomValues.foregroundColor.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: CustomValues.textFontSize,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                          color: CustomValues.foregroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
