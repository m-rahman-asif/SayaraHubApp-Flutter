import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:async';

class WelcomeController extends GetxController {

  final List<String> words = ["Fix", "Drive", "Find"];
  var currentIndex = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
  
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      currentIndex.value = (currentIndex.value + 1) % words.length;
    });
  }

  @override
  void onClose() {
    _timer?.cancel(); 
    super.onClose();
  }
  void onLetsGoPressed() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAllNamed('/home'); 
    } else {
      Get.toNamed('/auth');    
    }
  }
}