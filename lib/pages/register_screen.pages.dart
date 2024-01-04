import 'package:flutter/material.dart';
import 'package:login_screen_updated/pages/home_screen.pages.dart';
import 'package:login_screen_updated/pages/logIn_screen.pages.dart';
import 'package:login_screen_updated/utilities/colors.utilities.dart';
import 'package:login_screen_updated/widgets/CenterdLogo.widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _FullNameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  late GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void initState() {
    _FullNameController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();

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
//----------------------------------Register text ------------------------------
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "Register",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: "LightItalic",
              ),
            ),
          ),

//-----------------------------Full Name text Field-----------------------------
          Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: TextFormField(
                  controller: _FullNameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    label: Text(
                      'Full Name',
                      style: TextStyle(color: Colors.white60),
                    ),
                    prefixIcon: Icon(
                      Icons.person_outlined,
                      color: Colors.white60,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your User Name';
                    }
                    return null;
                  },
                ),
              ),
//----------------------------------Email text Field ---------------------------
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
                    if (value!.isEmpty || !(value.contains('@'))) {
                      return 'Please enter your email';
                    } else if (!RegExp(
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
//----------------------------------Password text Field ------------------------
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
            ]),
          ),
//----------------------------------Register Button ----------------------------
          Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0.0),
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String userName = _FullNameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    print(
                        'Username: $userName \n Email : $email \n Password: $password');

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white, // Use Colors.white for the text color
                  ),
                ),
              ),
            ),
          ),

//----------------------------------Ask for Sing in ----------------------------------
          const Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Already registered?",
              style: TextStyle(
                  color: Color(ColorsConst.containerWhiteBackgroundColor)),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text(
                "Sign in",
                style: TextStyle(color: Color(ColorsConst.orangeColor)),
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
