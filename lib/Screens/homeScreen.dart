import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_24/Screens/browse.dart';
import 'package:sih_24/Screens/legaltrends.dart';
import 'package:sih_24/Screens/mysaved.dart';
import 'package:sih_24/Screens/predictive.dart';
import 'package:sih_24/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(
            "assets/balance.png",
            color: Colors.white,
            height: 30,
          ),
          SizedBox(width: 16),
        ],
        backgroundColor: colors.background,
        foregroundColor: Colors.white,
        title: Text(
          "LegalLens",
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Mr.Yash Sharma",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                  ],
                ),
                Icon(
                  Icons.person,
                  size: 42,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCard(context, 'Predictive Case Outcome', Icons.analytics,
                    Colors.blue, PredictiveScreen()),
                buildCard(context, 'Browse Other Cases', Icons.search,
                    Colors.green, BrowseScreen()),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCard(context, 'Saved Cases', Icons.bookmark, Colors.orange,
                    MySavedCasesScreen()),
                buildCard(context, 'Legal Trends', Icons.trending_up,
                    Colors.purple, LegalTrendsScreen()),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

Widget buildCard(BuildContext context, String title, IconData icon, Color color,
    var screen) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        Get.to(screen, transition: Transition.fadeIn);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.31,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 60, color: color),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
