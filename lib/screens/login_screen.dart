import 'package:flutter/material.dart';
import 'package:todolist_app/screens/login_succes_screen.dart';
import 'package:todolist_app/screens/signup_screen.dart';
import 'package:todolist_app/user.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hello, ready to get started!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Please sign in with your email and password.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(emailController, 'Email', 'Enter your email'),
                  const SizedBox(height: 20),
                  _buildTextField(passwordController, 'Password', 'Enter your password', isPassword: true),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: _signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "If you don't have an account, please sign up.",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String hint, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      style: const TextStyle(color: Colors.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }

  void _signIn() {
    if (_formKey.currentState?.validate() ?? false) {
      if (emailController.text == User.email && passwordController.text == User.password) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginSuccess()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }
}
