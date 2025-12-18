import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: const Text("Notification", 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.notifications.length,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          final item = controller.notifications[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Slidable(
  key: ValueKey(index),
  endActionPane: ActionPane(
  motion: const ScrollMotion(),
  
  extentRatio: 0.25, 
  children: [
    CustomSlidableAction(
  onPressed: (context) => controller.removeNotification(index),
  backgroundColor: Colors.transparent, 
  padding: const EdgeInsets.only(left: 10), 
  child: Center( 
    child: Container(
      width: 70, 
      height: 80, 
      decoration: BoxDecoration(
        color: const Color(0xFF1E56D9), 
        borderRadius: BorderRadius.circular(12), 
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Delete.png', 
            width: 24, 
            height: 24,
            fit: BoxFit.contain,
          ),
          Text("Delete", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  ),
),
  ],
),
  child: _buildNotificationCard(item),
),
          );
        },
      )),
      bottomNavigationBar: _buildBottomNav(), // Fixed the 'undefined' error
    );
  }

  Widget _buildNotificationCard(Map<String, String> item) {
  
Widget _getIconData(String title) {
  // Condition for New/Feature Alerts
  if (title.contains('New')) {
    return Image.asset(
      'assets/new.png', 
      width: 24,
      height: 24,
      fit: BoxFit.contain,
    );
  }

  // Condition for Reminders
  if (title.contains('Reminder')) {
    return const Icon(
      Icons.notifications_none_outlined, 
      color: Color(0xFF1E56D9), 
      size: 24
    );
  }

  // Condition for Bookings (Default)
  return const Icon(
    Icons.calendar_month_outlined, 
    color: Color(0xFF1E56D9), 
    size: 24
  );
}

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFF1E56D9).withOpacity(0.3)),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Positioned(
            left: 0, top: 0, bottom: 0,
            child: Container(width: 5, color: const Color(0xFF1E56D9)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    
                    _getIconData(item['title']!),
                    const SizedBox(width: 10),
                    Text(item['title']!, 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(item['body']!, 
                  style: const TextStyle(color: Colors.black54, fontSize: 14, height: 1.3)),
                const SizedBox(height: 8),
                Text(item['time']!, 
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

 
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: 1, 
      selectedItemColor: const Color(0xFF1E56D9),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 0) Get.offAllNamed('/home');
        if (index == 2) Get.toNamed('/profile');
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}