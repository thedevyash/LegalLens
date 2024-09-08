import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  PageController pageController = PageController();
  void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.animateToPage(
      index,
      duration:
          Duration(milliseconds: 250), // Set the duration for the animation
      curve: Curves.easeIn, // Set the curve for the animation
    );
  }
}
