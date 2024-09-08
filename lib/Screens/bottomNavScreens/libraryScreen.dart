import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_24/utils/colors.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Coming Soon!",
          style: GoogleFonts.poppins(
              color: colors.background,
              fontSize: 28.0,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
