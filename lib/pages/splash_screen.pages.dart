// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:login_screen_updated/pages/home_screen.pages.dart';
import 'package:login_screen_updated/pages/logIn_screen.pages.dart';
import 'package:login_screen_updated/utilities/images_paths.utilities.dart';
import 'package:login_screen_updated/widgets/CenterdLogo.widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    if (GetIt.I.get<SharedPreferences>().getBool('isLogin') ?? false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      // go to home page
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      // go to login page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesPath.background), fit: BoxFit.cover),
        ),
        child: const Center(
          child: Column(children: [
            CenterdLogo(),
            CircularProgressIndicator(),
          ]),
        ),
      ),
    );
  }
}
