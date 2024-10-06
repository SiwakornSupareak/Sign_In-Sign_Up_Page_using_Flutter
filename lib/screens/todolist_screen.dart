import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  bool show = true;

  // Sign out user and navigate to login screen
  void signOutUser() {
    // Simulated sign out action
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade500,
        centerTitle: true,
        title: Text(
          "Task Management",
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: signOutUser,
            icon: const Icon(
              Icons.logout, // Change to logout icon for clarity
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            // You can add functionality here if needed
          },
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            setState(() {
              show = notification.direction == ScrollDirection.forward;
            });
            return true;
          },
          child: const Column(
            children: [
              // Replace this with your own task list implementation
              Center(child: Text('No tasks available')), // Placeholder for task list
              Text(
                'Completed Tasks',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Add your completed tasks list here
            ],
          ),
        ),
      ),
    );
  }
}
