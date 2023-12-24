import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_screen_updated/pages/home_screen.pages.dart';
import 'package:login_screen_updated/pages/register_screen.pages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController emailController;
  late TextEditingController passwordController;

  late GlobalKey<FormState> fromKey;

  bool obscureText = true;


  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fromKey = GlobalKey<FormState>();
    super.initState();
  }

  void toggleObscure() {
    obscureText = !obscureText;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Screen'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: fromKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            // App logo
            //TODO 1: Container with application logo

            // email text Field
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  suffixIcon: Icon(Icons.email),
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

            //space in between text fields
            const SizedBox(height: 16.0),

            // Password text Field
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                icon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () => toggleObscure(),
                    child: Icon(obscureText
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )
              ),
              obscureText: obscureText,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),

            //space in between text fields
            const SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: () {
                if (fromKey.currentState!.validate()) {
                  // Perform login logic here
                  String username = emailController.text;
                  String password = passwordController.text;

                  print('Username: $username\nPassword: $password');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),

           //space in between text fields
                const SizedBox(height: 10.0),

            ElevatedButton(
              onPressed: () {
                // TODO: Implement Facebook login logic
                print('Login with Facebook');
              },
              child: const Text('Login with Google'),
            ),

           //space in between text fields
                const SizedBox(height: 10.0),

            ElevatedButton(
              onPressed: () {
                // TODO: Implement Google login logic
                print('Login with Google');
              },
              child: const Text('Login with Facebook'),
            ),

           //space in between text fields
                const SizedBox(height: 20.0),

            GestureDetector(
              onTap: () {
                // Navigate to the registration screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text(
                'New here? Register now!',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
