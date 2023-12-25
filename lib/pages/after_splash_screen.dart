import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen_updated/pages/logIn_screen.pages.dart';
import 'package:login_screen_updated/pages/register_screen.pages.dart';

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

//----------------------------- background Image--------------------------
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/splash.png",
              ),
              fit: BoxFit.cover),
        ),

//------------------------------ logo In the center-----------------------

        // ToDO Ask Eng Mahmoud for an alternative solution instead of two Spacer,and what is flex
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(),

              Stack(children: [
                CircleAvatar(
                  backgroundColor: Colors.white60,
                  radius: 80.0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        FractionalTranslation(
                          translation: const Offset(0.0, 0.1),
                          child: Image.asset(
                            "assets/images/orange_logo.png",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(height:15),
                         Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            //TODO: Lemongrass Script font // size 40
                              "Daily Recipe " ,
                              textAlign: TextAlign.center ,
                            style: GoogleFonts.dancingScript(
                              textStyle:const TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black ,
                                fontSize: 30,

                              ),
                            ), // googleFont
                            ),
                          ),
                      ]),
                  ),
                ),
              ]),

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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const RegisterScreen()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 16),

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
