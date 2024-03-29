import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionState extends StatelessWidget {
  const DescriptionState({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: GoogleFonts.alkalami(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
