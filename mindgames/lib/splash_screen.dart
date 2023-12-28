import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:mindgames/Levels_screen.dart';
import 'package:mindgames/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();
    animation = Tween<double>(
      begin: 0.5, // Start from a smaller scale (center)
      end: 1.0, // Expand to normal scale
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getLanguageRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            ScaleTransition(
              scale: animation,
              child: Center(
                  child: Image.asset("assets/images/mindparklogo.png",
                      width: 350)),
            ),
          ],
        ),
      ),
    );
  }
}
