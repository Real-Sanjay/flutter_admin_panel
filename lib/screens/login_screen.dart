import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter both email and password', backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('email');
    final storedPassword = prefs.getString('password');

    if (storedEmail == email && storedPassword == password) {
      Get.offNamed('/home'); // Navigate to the home screen
    } else {
      Get.snackbar('Error', 'Invalid email or password', backgroundColor: Colors.red, colorText: Colors.white);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Admin Panel Login', style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              SizedBox(
                width: 300, // Set the desired width
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300, // Set the desired width
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _login(emailController.text, passwordController.text);
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/register');
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
