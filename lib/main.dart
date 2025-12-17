import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart'; // Required for Firebase
import 'app/modules/home/home_view.dart';
import 'app/modules/home/home_binding.dart';
import 'app/modules/notifications/notifications_view.dart';
import 'app/modules/notifications/notifications_binding.dart';

void main() async {
  // 1. Ensures Flutter is ready before initializing Firebase
  WidgetsFlutterBinding.ensureInitialized();
  
  // 2. Fixes the [core/no-app] error
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 3. Only ONE GetMaterialApp here to fix the GlobalKey error
    return GetMaterialApp(
      title: "SayaraHub",
      debugShowCheckedModeBanner: false,
      initialRoute: '/home', 
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/notifications',
          page: () => const NotificationsView(),
          binding: NotificationsBinding(), // Fixes 'undefined notifications'
        ),
      ],
    );
  }
}