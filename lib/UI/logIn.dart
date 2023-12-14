import 'package:flutter/material.dart';
import 'package:login_screen_updated/UI/home.dart';
import 'package:login_screen_updated/UI/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // App logo
            //TODO 1: Container with application logo

            // user name text Field
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                icon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),

            //space in between text fields
            const SizedBox(height: 20.0),

            // Password text Field
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),

            //space in between text fields
            const SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Perform login logic here
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  // TODO: Implement login logic with username and password
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

            const SizedBox(height: 10.0),

            ElevatedButton(
              onPressed: () {
                // TODO: Implement Facebook login logic
                print('Login with Facebook');
              },
              child: const Text('Login with Google'),
            ),

            const SizedBox(height: 10.0),

            ElevatedButton(
              onPressed: () {
                // TODO: Implement Google login logic
                print('Login with Google');
              },
              child: const Text('Login with Facebook'),
            ),

            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                // Navigate to the registration screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
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
