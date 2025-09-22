import 'package:flutter/material.dart';
import 'app_frame.dart';
import 'nextpage.dart';
import 'home.dart'; // ✅ make sure this file exists and has HomePage widget

class HomeStart extends StatelessWidget {
  const HomeStart({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      child: Stack(
        children: [
          // Centered welcome + Get Started
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Welcome to MemoryMate!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // ✅ Navigate to home.dart
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomePage()),
                    );
                  },
                  child: const Text("Get Started"),
                ),
              ],
            ),
          ),

          // Bottom-right Sign Out
          Positioned(
            right: 16,
            bottom: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const NextPage()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Sign Out"),
            ),
          ),
        ],
      ),
    );
  }
}
