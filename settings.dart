import 'package:flutter/material.dart';
import 'app_frame.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      child: Stack(
        children: [
          // Back Button (top-left)
          Positioned(
            left: 8,
            top: 40,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Title (center-top)
          const Positioned(
            top: 48,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Settings Options
          Positioned.fill(
            top: 100,
            child: ListView(
              children: [
                _buildSettingsTile(
                  context,
                  title: "Account Setting",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AccountSettingsPage(),
                      ),
                    );
                  },
                ),
                _buildSettingsTile(
                  context,
                  title: "Notification",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Notification clicked")),
                    );
                  },
                ),
                _buildSettingsTile(
                  context,
                  title: "Device Connections",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Device Connections clicked"),
                      ),
                    );
                  },
                ),
                _buildSettingsTile(
                  context,
                  title: "Display & Mode",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Display & Mode clicked")),
                    );
                  },
                ),
                _buildSettingsTile(
                  context,
                  title: "Support",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Support clicked")),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      onTap: onTap,
    );
  }
}

// ✅ Account Settings Page (inside same file, same structure)
class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      child: Stack(
        children: [
          // Back Button
          Positioned(
            left: 8,
            top: 40,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Title
          const Positioned(
            top: 48,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Account Setting",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Content
          Positioned.fill(
            top: 100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: const [
                  Text(
                    "PROFILE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text("First Name:"),
                  Text("Last Name:"),
                  Text("Email:"),
                  Text("Contact Number"),
                  SizedBox(height: 20),

                  Text(
                    "SECURITY",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text("Change Password"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
