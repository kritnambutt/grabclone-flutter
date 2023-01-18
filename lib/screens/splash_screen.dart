import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import 'package:grabclone/routes/routes_lib.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((value) =>
        GoRouter.of(context).goNamed(RouteName.onboardingScreen.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage("assets/images/logo/logo-paloit.png"),
                  width: 200,
                ),
                SizedBox(
                  height: 50,
                ),
                SpinKitFadingCircle(
                  color: Colors.orange,
                  size: 50.0,
                )
              ],
            )));
  }
}
