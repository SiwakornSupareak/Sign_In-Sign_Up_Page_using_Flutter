import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for SystemChrome
import 'package:todolist_app/screens/login_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:todolist_app/firebase_options.dart';

void main() async {
  // Ensure WidgetsFlutterBinding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set the app to fullscreen mode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const SignInScreen(),
    );
  }
}
