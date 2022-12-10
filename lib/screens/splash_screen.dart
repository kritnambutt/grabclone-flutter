import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_app/screens/home_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value) => {
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (ctx) => const HomeScreen()))
        });
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
