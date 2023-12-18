import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserData(String firstName, String lastName, String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('firstName', firstName);
  prefs.setString('lastName', lastName);
  prefs.setString('email', email);
  prefs.setString('password', password);
}
