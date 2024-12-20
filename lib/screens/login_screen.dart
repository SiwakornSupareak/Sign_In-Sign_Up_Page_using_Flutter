import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todolist_app/screens/login_success_screen.dart';
import 'package:todolist_app/screens/signup_screen.dart'; // Update with your actual path

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Hello, ready to get started!',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 15),
                    const Text('Please sign in with your email and password.',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    _buildTextField(emailController, 'Email', 'Enter your email'),
                    const SizedBox(height: 20),
                    _buildTextField(passwordController, 'Password', 'Enter your password', isPassword: true),
                    const SizedBox(height: 25),
                    _buildForgotPasswordButton(),
                    const SizedBox(height: 0),
                    _isLoading ? const CircularProgressIndicator() : _buildSignInButton(),
                    const SizedBox(height: 20),
                    _buildConnectWithText(),
                    const SizedBox(height: 10),
                    _buildSocialMediaIcons(),
                    const SizedBox(height: 20),
                    _buildSignUpButton(),
                    const SizedBox(height: 10),
                    const Text("If you don't have an account, please sign up.",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password recovery not implemented.')),
            );
          },
          child: const Text('Forgot Password?', style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return ElevatedButton(
      onPressed: _signIn,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      ),
      child: const Text('Sign In', style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }

  Widget _buildConnectWithText() {
    return const Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Divider(thickness: 1, color: Colors.black54)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Or connect with', style: TextStyle(fontSize: 16, color: Colors.black54)),
            ),
            Expanded(child: Divider(thickness: 1, color: Colors.black54)),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/google.png', width: 40, height: 40),
        const SizedBox(width: 20),
        Image.asset('assets/images/facebook.png', width: 60, height: 60),
        const SizedBox(width: 20),
        Image.asset('assets/images/ios.png', width: 40, height: 40),
      ],
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

  void _signIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Navigate to the success screen if the sign-in is successful
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginSuccess()),
        );
      } on FirebaseAuthException catch (firebaseError) {
        String errorMessage;

        // Log the error for debugging
        print('FirebaseAuthException: ${firebaseError.code} - ${firebaseError.message}');

        switch (firebaseError.code) {
          // case 'user-not-found':
          //   errorMessage = 'No user found for that email.';
          //   break;
          // case 'wrong-password':
          //   errorMessage = 'Wrong password provided for that user.';
          //   break;
          // case 'invalid-email':
          //   errorMessage = 'The email address is not valid.';
          //   break;
          default:
            errorMessage = 'Wrong email or password.';
        }

        // Show the error message to the user
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
      } catch (e) {
        // Log the unexpected error
        print('Unexpected error: $e');

        // Handle other unexpected errors
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('An unexpected error occurred. Please try again.')));
      } finally {
        // Ensure loading state is updated regardless of outcome
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildSignUpButton() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpPage()));
      },
      child: const Text('Sign Up', style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
    );
  }
}
