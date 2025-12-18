import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:async';

class WelcomeController extends GetxController {

  final List<String> words = ["Fix", "Drive", "Find"];
  var currentIndex = 0.obs; // .obs makes it observable by the UI
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Start cycling every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      currentIndex.value = (currentIndex.value + 1) % words.length;
    });
  }

  @override
  void onClose() {
    _timer?.cancel(); // Clean up the timer when the screen is closed
    super.onClose();
  }
  void onLetsGoPressed() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAllNamed('/home'); // Go to Home if session exists
    } else {
      Get.toNamed('/auth');    // Go to Login if new user
    }
  }
}