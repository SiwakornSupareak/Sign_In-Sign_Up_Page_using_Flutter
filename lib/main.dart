import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for SystemChrome
import 'package:todolist_app/screens/login_screen.dart';

void main() {
  // Set the app to fullscreen mode
  WidgetsFlutterBinding.ensureInitialized();
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
