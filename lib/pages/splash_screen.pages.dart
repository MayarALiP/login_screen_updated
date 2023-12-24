import 'package:flutter/material.dart';
import 'package:login_screen_updated/pages/after_splash_screen.dart';
import 'package:login_screen_updated/pages/home_screen.pages.dart';
import 'package:login_screen_updated/services/preferences.service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initSplash();
    super.initState();
  }

  void initSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    if (PreferencesService.checkUser()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
      // go to home page
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AfterSplashScreen()),
      );
      // go to login page
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

