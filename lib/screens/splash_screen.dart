import 'dart:async';

import 'package:quick_bank_ui/custom_values.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 1500),
      () => Navigator.pushReplacementNamed(context, '/welcome'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomValues.primaryColor,
      body: Center(
        child: Iconify(
          CustomValues.splashScreenIcon,
          size: 64,
          color: CustomValues.foregroundColor,
        ),
      ),
    );
  }
}
