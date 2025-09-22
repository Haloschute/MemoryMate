import 'start.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'app_frame.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  // 🔑 Hardcoded account
  final String demoEmail = "123@gmail.com";
  final String demoPassword = "123";

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      child: Stack(
        children: [
          const Positioned(
            left: 129,
            top: 108,
            child: Text(
              'MemoryMate',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Email
          Positioned(
            left: 29,
            top: 160,
            child: SizedBox(
              width: 320,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),

          // Password
          Positioned(
            left: 29,
            top: 260,
            child: SizedBox(
              width: 320,
              child: TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),

          // Sign In
          Positioned(
            left: 29,
            top: 360,
            child: SizedBox(
              width: 320,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C2C2C),
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (emailController.text == demoEmail &&
                      passwordController.text == demoPassword) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeStart()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Invalid email or password"),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),

          // Forgot Password
          const Positioned(
            left: 29,
            top: 420,
            child: Text(
              "Forgot password?",
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ),

          // Create Account → Signup
          Positioned(
            left: 112,
            top: 727,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignUpStart()),
                );
              },
              child: const Text(
                "CREATE ACCOUNT",
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),

          // "Don’t have an account yet?"
          const Positioned(
            left: 98,
            top: 696,
            child: Text(
              'Don’t have an account yet? ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          // Bottom bar
          Positioned(
            left: 0,
            top: 778,
            child: SizedBox(
              width: 375,
              height: 34,
              child: Center(
                child: Container(
                  width: 134,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
