import 'package:flutter/material.dart';
import 'package:todolist_app/screens/login_screen.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set background color to black
        title: const Text(
          'Login Successful',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Set back icon color to white
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SignInScreen()), // Navigate back to SignInScreen
            );
          },
        ),
      ),
      body: Container(
        color: Colors.transparent, // Set background color to white
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                size: 100, // Icon size
                color: Colors.green, // Success color
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to your ToDoList!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set text color to black
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'You have successfully logged in.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey, // Subtitle color
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Optionally add functionality for another action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
