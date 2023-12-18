import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_screen_updated/UI/logIn_screen.ui.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
          () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoginScreen (),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset("assets/images/splash.webp"),
    );
  }
}
