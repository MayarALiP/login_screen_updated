import 'package:flutter/material.dart';
import 'package:login_screen_updated/pages/logIn_screen.pages.dart';
import 'package:login_screen_updated/pages/register_screen.pages.dart';
import 'package:login_screen_updated/widgets/CenterdLogo.widgets.dart';

class AfterSplashScreen extends StatefulWidget {
  const AfterSplashScreen({super.key});

  @override
  State<AfterSplashScreen> createState() => _AfterSplashScreenState();
}

class _AfterSplashScreenState extends State<AfterSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

//----------------------------- background Image--------------------------------
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/splash.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
//------------------------------------------------------------------------------

        // TODO :Ask(1) Eng Mahmoud for an alternative solution instead of two Spacer,and what is flex
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),

//------------------------------ logo In the center-----------------------------
          const CenterdLogo(),
           const SizedBox(height: 8),
          const Text(
            "-Cooking Done The Easy Way-",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 18,
            ),
          ),
          const Spacer(),

//------------------------------Navigation bottoms -----------------------

          Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
//------------------------------ Register Button -----------------------

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterScreen()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 16),

//------------------------------ Sing in-----------------------

                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()));
                    },
                    child: const Text(
                      "Sing In",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}

