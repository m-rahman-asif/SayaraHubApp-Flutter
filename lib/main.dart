import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart'; // Added for persistent hardcoded data
import 'package:sayara_hub/app/modules/auth/auth_view.dart';
import 'app/modules/home/home_view.dart';
import 'app/modules/home/home_binding.dart';
import 'app/modules/notifications/notifications_view.dart';
import 'app/modules/notifications/notifications_binding.dart';
import 'package:firebase_auth/firebase_auth.dart'; // <--- ADD THIS LINE
import 'package:get/get.dart';
// 1. IMPORT YOUR NEW PROFILE FILES HERE
import 'app/modules/profile/profile_view.dart';
import 'app/modules/profile/profile_binding.dart';
import 'app/modules/profile/profile_controller.dart';
import 'app/modules/auth/auth_binding.dart';
import 'app/data/services/auth_service.dart';
import 'package:sayara_hub/app/modules/welcome/welcome_view.dart';
import 'package:sayara_hub/app/modules/welcome/welcome_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  // Initialize your service so AuthService.to is available
  Get.put(AuthService()); 
  Get.put(WelcomeController());

  User? user = FirebaseAuth.instance.currentUser;
  //String initialRoute = '/welcome';

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/welcome',
    getPages: [
  GetPage(name: '/welcome', page: () => WelcomeView()),
  GetPage(name: '/auth', page: () => const AuthView(), binding: AuthBinding()),
  GetPage(name: '/home', page: () => const HomeView(), binding: HomeBinding()),
  GetPage(name: '/profile', page: () => const ProfileView(), binding: ProfileBinding()),
  // ADD THIS LINE:
  GetPage(
    name: '/notifications', 
    page: () => const NotificationsView(), 
    binding: NotificationsBinding() // Ensures NotificationsController is loaded
  ),
],
  ));
}