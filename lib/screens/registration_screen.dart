import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _register(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    Get.offNamed('/login'); // Navigate back to the login screen
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
              Text('Admin Panel Registration', style: TextStyle(fontSize: 24)),
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
                  _register(emailController.text, passwordController.text);
                },
                child: Text('Register'),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
