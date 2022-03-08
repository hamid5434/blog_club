import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/home.dart';
import 'package:flutter/material.dart';

import 'onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.img.background.splash.image(
              fit: BoxFit.cover,
            ),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.logo.svg(width: 140),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  backgroundColor: Colors.grey.withOpacity(.2),
                  color: Theme.of(context).primaryColorLight,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
