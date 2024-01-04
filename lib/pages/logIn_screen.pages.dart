// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get_it/get_it.dart';
import 'package:login_screen_updated/pages/home_screen.pages.dart';
import 'package:login_screen_updated/pages/register_screen.pages.dart';
import 'package:login_screen_updated/widgets/CenterdLogo.widgets.dart';
import 'package:login_screen_updated/utilities/colors.utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _fromKey;
  bool obscureText = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _fromKey = GlobalKey<FormState>();
    super.initState();
  }

  void toggleObscure() {
    obscureText = !obscureText;
    setState(() {});
  }

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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),

//-----------------------------------Logo---------------------------------------
          const CenterdLogo(),
//----------------------------------Sign in text -------------------------------
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: "LightItalic"),
            ),
          ),
//-------------------------------Email Text Field-------------------------------
          Form(
            key: _fromKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      label: Text(
                        'Email Address',
                        style: TextStyle(color: Colors.white60),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white60,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email is required';
                      }

                      if (!EmailValidator.validate(value)) {
                        return 'Not Valid Email';
                      }
                      return null;
                    }),
              ),
//-------------------------------Password Text Field----------------------------
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    label: const Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_open,
                      color: Colors.white60,
                    ),
                    suffixIcon: InkWell(
                      onTap: () => toggleObscure(),
                      child: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                  obscureText: obscureText,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
//-------------------------------Forgot Password--------------------------------
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password?",
                      style:
                          TextStyle(color: Color(ColorsConst.titleBlueColor)),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
//-------------------------------Sing in button---------------------------------
          Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 100.0),
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(ColorsConst.orangeColor)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () async {
                  if (_fromKey.currentState!.validate()) {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    print('Username: $email \n Password: $password');

                    GetIt.I.get<SharedPreferences>().setBool('isLogin', true);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Sing In',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(ColorsConst.containerWhiteBackgroundColor),
                  ),
                ),
              ),
            ),
          ),

//--------------------------------Ask to register-------------------------------
          const Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(
                color: Color(ColorsConst.containerWhiteBackgroundColor),
                fontFamily: "LightItalic",
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text(
                "Register",
                style: TextStyle(
                  color: Color(ColorsConst.orangeColor),
                  fontFamily: "LightItalic",
                ),
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
