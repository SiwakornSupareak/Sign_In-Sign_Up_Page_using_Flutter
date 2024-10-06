import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    Key? key, // Use Key? for better compatibility
    required this.imagePath, required String imagPath, // Corrected to 'imagePath' for clarity
  }) : super(key: key);

  final String imagePath; // Corrected variable name

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade600,
      ),
      child: Image.asset(
        imagePath,
        height: 40,
        fit: BoxFit.contain, // Added fit property for better image rendering
      ),
    );
  }
}
