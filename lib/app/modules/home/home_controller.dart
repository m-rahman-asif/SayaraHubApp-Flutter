import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  
  final Rx<User?> user = FirebaseAuth.instance.currentUser.obs;


  final ScrollController scrollController = ScrollController();

  final List<Map<String, String>> garages = [
    {
      'name': 'Al Majid Auto Service',
      'image': 'assets/auto1.png',
      'rating': '4.8',
      'reviews': '127',
      'distance': '2.3 km',
      'services': 'AC • Engine • Brakes',
    },
    {
      'name': 'Emirates Auto Care',
      'image': 'assets/auto2.png',
      'rating': '4.9',
      'reviews': '89',
      'distance': '1.8 km',
      'services': 'Luxury • German Cars',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    
    WidgetsBinding.instance.addPostFrameCallback((_) => _startMarquee());
  }

  void _startMarquee() {
  if (scrollController.hasClients) {
   
    double scrollDistance = 500.0; 
    
    scrollController.animateTo(
      scrollController.offset + scrollDistance,
      duration: const Duration(seconds: 5), 
      curve: Curves.linear, 
    ).then((_) {
      
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