import 'package:flutter/material.dart';
import 'package:todolist_app/user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.transparent, // Set background color to white
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200], // Light grey background for input
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
                keyboardAppearance: Brightness.light, // Light keyboard
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                keyboardAppearance: Brightness.light, // Light keyboard
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                keyboardAppearance: Brightness.light, // Light keyboard
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Re-enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                keyboardAppearance: Brightness.light, // Light keyboard
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    User.email = emailController.text;
                    User.password = passwordController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sign Up Complete')),
                    );
                    Navigator.of(context).pop(); // Go back to sign-in page
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                child: const Text(
                  'Sign Up',
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
