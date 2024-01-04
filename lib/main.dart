import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:login_screen_updated/pages/splash_screen.pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    var preference = await SharedPreferences.getInstance();
    GetIt.I.registerSingleton<SharedPreferences>(preference);

    // if (PreferencesService.prefs != null) {
    //   print(
    //       '========================= Preferences init Successfully ========================');
    // }
  } catch (e) {
    print(
        '=========================Error In init Preferences $e========================');
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xfff45b00)),
        // colorScheme: ColorScheme.fromSeed(seedColor:ColorsConst.orangeColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
