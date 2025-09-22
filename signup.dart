import 'package:flutter/material.dart';
import 'app_frame.dart';
import 'nextpage.dart'; // ✅ Import your next page

class SignUpStart extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      child: Stack(
        children: [
          const Positioned(
            left: 100,
            top: 80,
            child: Text(
              "Create an account",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Positioned(
            left: 60,
            top: 120,
            child: Text(
              "Enter your email to sign up for this app",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),

          // Email field
          Positioned(
            left: 28,
            top: 180,
            child: SizedBox(
              width: 320,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "email@domain.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),

          // Continue button
          Positioned(
            left: 28,
            top: 260,
            child: SizedBox(
              width: 320,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignUpCaregiver()),
                  );
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpCaregiver extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController relationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const Text(
              "Caregiver Info",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: "First Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: "Last Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Phone Number"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Confirm Password"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: relationController,
              decoration: const InputDecoration(
                labelText: "Relationship with Patient",
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignUpPatient()),
                );
              },
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPatient extends StatefulWidget {
  @override
  State<SignUpPatient> createState() => _SignUpPatientState();
}

class _SignUpPatientState extends State<SignUpPatient> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();

  String? gender;
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const Text(
              "Patient Info",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: "First Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: "Last Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: birthDateController,
              decoration: const InputDecoration(
                labelText: "Birthdate (mm/dd/yyyy)",
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "Gender",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: "Male",
                    groupValue: gender,
                    onChanged: (val) {
                      setState(() => gender = val);
                    },
                    title: const Text("Male"),
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: "Female",
                    groupValue: gender,
                    onChanged: (val) {
                      setState(() => gender = val);
                    },
                    title: const Text("Female"),
                  ),
                ),
              ],
            ),

            TextField(
              controller: diagnosisController,
              decoration: const InputDecoration(
                labelText: "Diagnosis/Medical Condition",
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Checkbox(
                  value: agreed,
                  onChanged: (val) {
                    setState(() => agreed = val ?? false);
                  },
                ),
                const Expanded(
                  child: Text("I agree to the Terms and Privacy Policy"),
                ),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: agreed
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Account Created!")),
                      );

                      // ✅ Navigate to NextPage after account creation
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => NextPage()),
                      );
                    }
                  : null, // disabled if not agreed
              child: const Text(
                "SIGN UP",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
