import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/pages/search_form_field.dart';

class AppBarStyle extends StatelessWidget {
  const AppBarStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'WeatherApp',
          style: GoogleFonts.alkalami(fontSize: 20, color: Colors.white),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchFormPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
