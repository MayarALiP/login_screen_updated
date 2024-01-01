import 'package:flutter/material.dart';
import 'package:login_screen_updated/pages/splash_screen.pages.dart';
import 'package:login_screen_updated/services/preferences.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    PreferencesService.prefs = await SharedPreferences.getInstance();

    if (PreferencesService.prefs != null) {
      print(
          '========================= prefrences init Successfully ========================');
    }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //   inputDecorationTheme: InputDecorationTheme(
        //     filled: true,
        //     fillColor: Colors.grey.shade200,
        //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //   ),
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
