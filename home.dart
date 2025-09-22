import 'package:flutter/material.dart';
import 'app_frame.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      // Navigate to Account Settings (User icon tapped)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AccountSettingsPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      child: Stack(
        children: [
          // Header (Hi, CareGName)
          Positioned(
            left: 16,
            top: 100,
            child: const Text(
              "Hi, CareGiver 123",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
          ),

          // Settings Icon (top-right)
          Positioned(
            right: 16,
            top: 100,
            child: IconButton(
              icon: const Icon(Icons.settings, size: 28),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()),
                );
              },
            ),
          ),

          // Assigned Patient Label
          const Positioned(
            left: 16,
            top: 160,
            child: Text(
              "ASSIGNED PATIENT",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),

          // Patient Card
          Positioned(
            left: 16,
            top: 190,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar + Edit Button
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Edit patient clicked")),
                        );
                      },
                      child: const Text("Edit"),
                    ),
                  ],
                ),
                const SizedBox(width: 20),

                // Patient Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Patient #1",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "RALEX ANZANO",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text("Female", style: TextStyle(fontSize: 14)),
                    Text("Age: 69", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),

          // Add Patient Button (above nav bar)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Add Patient clicked")),
                  );
                },
                child: Container(
                  width: 228,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Add Patient",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),

          // ✅ Bottom navigation (inside AppFrame)
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "User",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
