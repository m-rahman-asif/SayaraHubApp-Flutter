import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Icon(Icons.directions_car, color: Color(0xFF1E56D9)),
            const SizedBox(width: 8),
            const Text("SayaraHub", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Obx(() => CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(controller.user.value?.photoURL ?? 'https://via.placeholder.com/150'),
            )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchCard(),
            _buildEmergencyBanner(),
            _buildSectionHeader("Popular Services"),
            _buildServiceGrid(),
            _buildSectionHeader("Top Rated Garages", showViewAll: true),
            _buildGarageList(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildSearchCard() {
  return Container(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFF1E56D9), // Primary brand blue
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Find Car Services Near You",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Emergency repairs, maintenance & more",
          style: TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 20),
        
        // The White Filter Box
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // Location Dropdown
                  Expanded(
                    child: _buildDropdownField("location"),
                  ),
                  const SizedBox(width: 12),
                  // Service Type Dropdown
                  Expanded(
                    child: _buildDropdownField("Service type..."),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Search Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E6FF1), // Brighter blue button
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Search garage",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        
        // Brand Icons Row
        _buildBrandMarquee(),
      ],
    ),
  );
}

// Place this inside your HomeView class
Widget _buildBrandMarquee() {
  final List<String> logos = [
    'assets/Subaru.png', 'assets/Nissan.png', 'assets/Chery.png',
    'assets/Suzuki.png', 'assets/Datsun.png', 'assets/Hyundai.png'
  ];

  return Container(
    height: 45,
    margin: const EdgeInsets.only(top: 20),
    decoration: BoxDecoration(
      color: Colors.white, // White background strip
      borderRadius: BorderRadius.circular(12),
    ),
    child: ListView.builder(
      controller: controller.scrollController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      // itemBuilder uses modulo to loop through the logo list endlessly
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Image.asset(
            logos[index % logos.length], 
            height: 25,
            fit: BoxFit.contain,
          ),
        );
      },
    ),
  );
}

// Helper for the dropdown style
Widget _buildDropdownField(String hint) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(hint, style: TextStyle(color: Colors.grey.shade500, fontSize: 14)),
        const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20),
      ],
    ),
  );
}

// Helper for the Brand Logos
Widget _buildBrandIcon(String assetPath) {
  return Padding(
    padding: const EdgeInsets.only(right: 15),
    child: Image.asset(assetPath, height: 25, fit: BoxFit.contain),
  );
}

  Widget _buildEmergencyBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFE94444), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 32),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Emergency Service", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("24/7 Available", style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), elevation: 0, backgroundColor: Colors.white, foregroundColor: Colors.red),
            child: const Text("Search Now"),
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool showViewAll = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          if (showViewAll) const Text("View All", style: TextStyle(color: Color(0xFF1E56D9))),
        ],
      ),
    );
  }

  Widget _buildServiceGrid() {
  // Define your services with the paths to your new images
  final services = [
    {'name': 'AC Repair', 'image': 'assets/ac_repair.png'},
    {'name': 'Tires', 'image': 'assets/tires.png'},
    {'name': 'Engine', 'image': 'assets/engine.png'},
    {'name': 'Electrical', 'image': 'assets/electrical.png'},
    {'name': 'battery', 'image': 'assets/battery.png'}, // Added from image
    {'name': 'spares', 'image': 'assets/spares.png'},
  ];

 return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3, 
      childAspectRatio: 2.1, 
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    ),
    itemCount: services.length,
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        // Center the Row content inside the Container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centers the group horizontally
          crossAxisAlignment: CrossAxisAlignment.center, // Centers the group vertically
          children: [
            Image.asset(
              services[index]['image']!,
              width: 18, 
              height: 18,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 6),
            Text(
              services[index]['name']!,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D3142),
              ),
            ),
          ],
        ),
      );
    },
  );
}
 Widget _buildGarageList() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: controller.garages.length, // Uses the actual list length
    itemBuilder: (context, index) {
      final garage = controller.garages[index]; // Get current garage data
      
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                garage['image']!, // Dynamic image
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    garage['name']!, // Dynamic Name
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(
                        " ${garage['rating']}", // Dynamic Rating
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(
                        " (${garage['reviews']}) • ${garage['distance']}", // Dynamic distance
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          "Open",
                          style: TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          garage['services']!, // Dynamic services
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_vert, color: Colors.grey),
          ],
        ),
      );
    },
  );
}

}



  Widget _buildBottomNav() {
  return BottomNavigationBar(
    currentIndex: 0, // Highlight the Home icon
    selectedItemColor: const Color(0xFF1E56D9), // Primary blue from your brand
    unselectedItemColor: Colors.grey,
    onTap: (index) {
      if (index == 0) {
        // Already on Home, do nothing or scroll to top
      } else if (index == 1) {
        // Navigate to Notifications
        Get.toNamed('/notifications'); 
      } else if (index == 2) {
        // Navigate to Profile
        Get.toNamed('/profile');
      }
    },
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notification'),
      BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
    ],
  );
}
