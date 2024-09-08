import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_24/Screens/bottomNavScreens/libraryScreen.dart';
import 'package:sih_24/Screens/bottomNavScreens/myProfile.dart';
import 'package:sih_24/Screens/bottomNavScreens/settings.dart';
import 'package:sih_24/Screens/mysaved.dart';
import 'package:sih_24/Screens/homeScreen.dart';
import 'package:sih_24/controllers/uicontroller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.put(HomeController());
  var pages = [
    HomeScreen(),
    LibraryScreen(),
    SettingsScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: homeController.pageController,
        children: pages,
      ),
      bottomNavigationBar: Obx(() => SafeArea(
            child: Container(
              height: 110,
              child: FloatingNavbar(
                borderRadius: 27,
                backgroundColor: Color(0xff180161),
                selectedBackgroundColor: Color(0xff180161),
                selectedItemColor: Color(0xffC7FFD8),
                onTap: (index) {
                  homeController.changeTabIndex(index);
                },
                currentIndex: homeController.tabIndex.value,
                fontSize: 12,
                items: [
                  FloatingNavbarItem(icon: Icons.home, title: 'Home'),
                  FloatingNavbarItem(icon: Icons.search, title: 'Library'),
                  FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
                  FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
                ],
              ),
            ),
          )),
    );
  }
}
