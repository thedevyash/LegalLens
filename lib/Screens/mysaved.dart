import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_24/utils/colors.dart';

class MySavedCasesScreen extends StatefulWidget {
  const MySavedCasesScreen({super.key});

  @override
  State<MySavedCasesScreen> createState() => _MySavedCasesScreenState();
}

class _MySavedCasesScreenState extends State<MySavedCasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          textAlign: TextAlign.center,
          "Uh-oh! You dont have any saved cases",
          style: GoogleFonts.poppins(
              color: colors.background,
              fontSize: 28.0,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
    ;
  }
}
