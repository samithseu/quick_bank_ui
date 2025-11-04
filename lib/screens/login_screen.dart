import 'package:flutter/material.dart';
import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/screens/register_screen.dart';
import 'package:quick_bank_ui/widgets/custom_filled_button.dart';
import 'package:quick_bank_ui/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    "Login",
                    style: TextStyle(
                      fontSize: CustomValues.titleFontSize,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.4,
                      height: 1.25,
                      color: CustomValues.foregroundColor,
                    ),
                  ),
                  Text(
                    "Fill your credentials to get started",
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
                    CustomInput(title: "Phone", placeholder: "Enter phone..."),
                    CustomInput(title: "Email", placeholder: "Enter email..."),
                  ],
                ),
                const SizedBox(height: CustomValues.spacing),
                CustomFilledButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/widget_tree');
                  },
                  text: "Login",
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No account?",
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
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Register",
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
