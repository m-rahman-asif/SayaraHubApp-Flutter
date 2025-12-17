import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Double check this path! If your file is in the same folder, use:
import 'profile_controller.dart'; 

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // If 'controller' is red here, it means ProfileBinding wasn't loaded 
    // or the import above is failing.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Profile", 
          style: TextStyle(color: Color(0xFF1E56D9), fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Obx(() => Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: controller.photoUrl.value.isNotEmpty 
                      ? NetworkImage(controller.photoUrl.value) 
                      : null,
                  child: controller.photoUrl.value.isEmpty ? const Icon(Icons.person, size: 50) : null,
                ),
                const SizedBox(height: 12),
                Text(controller.name.value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email_outlined, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(controller.email.value, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(width: 15),
                    const Icon(Icons.phone_outlined, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(controller.phone.value, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            )),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Align(alignment: Alignment.centerLeft,
                child: Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height: 15),
            _buildSettingsItem(
              icon: Icons.notifications_none,
              title: "Notifications",
              subtitle: "Enable Push Notification",
              trailing: Obx(() => Switch(
                value: controller.isNotifEnabled.value,
                onChanged: (v) => controller.toggleNotifications(v),
                activeColor: const Color(0xFF1E56D9),
              )),
            ),
            _buildSettingsItem(
              icon: Icons.lock_outline,
              title: "Change Password",
              subtitle: "Update your login password for security",
              trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () => controller.logout(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.logout, color: Colors.red, size: 20),
                  ),
                  const SizedBox(width: 12),
                  const Text("Sign Out", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // Ensure these helper methods are INSIDE the ProfileView class
  Widget _buildSettingsItem({required IconData icon, required String title, required String subtitle, required Widget trailing}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: 2,
      selectedItemColor: const Color(0xFF1E56D9),
      onTap: (index) {
        if (index == 0) Get.offAllNamed('/home');
        if (index == 1) Get.toNamed('/notifications');
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notification'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}