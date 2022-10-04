import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_ismail/src/config/routes/routes_manager.dart';
import 'package:flutter_clean_architecture_ismail/src/core/utils/assets_manager.dart';

import '../../../../core/utils/colors/colors_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  void _initTimer() =>
      timer = Timer(const Duration(milliseconds: 2000), () => _goNext());

  void _goNext() => Navigator.of(context)
      .pushReplacementNamed(RoutesManager.randomQuoteRoute);

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      body: Center(
        child: Image.asset(AssetsManager.logo),
      ),
    );
  }
}
