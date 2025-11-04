import 'package:quick_bank_ui/custom_values.dart';
import 'package:quick_bank_ui/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late TextStyle titleTextStyle = TextStyle(
    fontSize: CustomValues.titleFontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    height: 1.25,
    color: CustomValues.foregroundColor,
  );

  final TextStyle subtleTextStyle = TextStyle(
    fontSize: CustomValues.textFontSize,
    height: 1.6,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    color: CustomValues.foregroundColor.withValues(alpha: 0.7),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomValues.secondaryColor,
      body: Container(
        padding: EdgeInsets.all(CustomValues.spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Experience the \nModern Cash Flow",
              textAlign: TextAlign.center,
              style: titleTextStyle,
            ),
            Lottie.asset(
              "assets/lottie/online-banking.json",
              width: 264,
              fit: BoxFit.cover,
              frameRate: FrameRate(60),
            ),
            Text(
              "Simplify your life and transfer the money whenever and wherever\nyou want!",
              textAlign: TextAlign.center,
              style: subtleTextStyle,
            ),
            Column(
              children: [
                CustomFilledButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  text: "Get Started",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
