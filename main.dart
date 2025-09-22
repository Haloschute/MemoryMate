import 'package:flutter/material.dart';
import 'nextpage.dart';
import 'app_frame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartView(),
    );
  }
}

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      child: Stack(
        children: [
          // Bottom bar
          Positioned(
            left: 0,
            top: 778,
            child: Container(
              width: 375,
              height: 34,
              child: Stack(
                children: [
                  Positioned(
                    left: 121,
                    top: 21,
                    child: Container(
                      width: 134,
                      height: 5,
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // App name
          const Positioned(
            left: 116,
            top: 96,
            child: Text(
              'MemoryMate',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.50,
                letterSpacing: -0.24,
              ),
            ),
          ),

          // "Get Started" button
          Positioned(
            left: 25,
            top: 664.98,
            child: SizedBox(
              width: 326,
              height: 61.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF61C2D0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NextPage()),
                  );
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Color(0xFFF9F5F5),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),

          // Image
          Positioned(
            left: 33,
            top: 184,
            child: Container(
              width: 318,
              height: 316,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://placehold.co/318x316"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Text under the image
          const Positioned(
            left: 33,
            top: 531,
            child: SizedBox(
              width: 321,
              child: Text(
                'ANG LOLA/LOLO MO BA AY ULYANIN? TUTULUNGAN KA NI MEMORYMATE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
