import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  // 1. Define the user variable to fix the 'undefined_getter' error
  final Rx<User?> user = FirebaseAuth.instance.currentUser.obs;

  // 2. Define the ScrollController for the brand marquee
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    // Start marquee animation after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _startMarquee());
  }

  void _startMarquee() {
  if (scrollController.hasClients) {
    // We animate a fixed distance (e.g., 500 pixels) at a constant speed
    double scrollDistance = 500.0; 
    
    scrollController.animateTo(
      scrollController.offset + scrollDistance,
      duration: const Duration(seconds: 5), // Adjust seconds to change speed
      curve: Curves.linear, // Essential for marquee effect
    ).then((_) {
      // Once the 500px animation finishes, we call it again to continue
      _startMarquee();
    });
  }
}

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}