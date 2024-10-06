import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.onTap,
    required this.hinText,
  }) : super(key: key);

  final VoidCallback? onTap; // Use VoidCallback for better type safety
  final String hinText; // Specify the type for hinText

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.symmetric(horizontal: 25.0), // Use symmetric instead of directional
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            hinText,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleLarge,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
