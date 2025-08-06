import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/modules/otp_login/mobile_number_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterSplashScreen.scale(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange, Colors.orange],
          ),
          childWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("assets/AppLogo.png"),
              ),
              const SizedBox(
                height: 80,
              ), // Increased space between logo and loader
            ],
          ),
          duration: const Duration(milliseconds: 2500),
          animationDuration: const Duration(milliseconds: 2000),
          onAnimationEnd: () => debugPrint("On Scale End"),
          nextScreen: MobileNumberScreen(),
        ),
        Positioned(
          bottom:
              MediaQuery.of(context).size.height *
              0.15, // Position 15% from bottom
          left: 0,
          right: 0,
          child: Column(
            children: [
              SizedBox(
                height: 50, // Smaller size for loader
                width: 50,
                child: Image.asset("assets/laoding_clock.gif"),
              ),
              const SizedBox(height: 8),
              Text(
                "Loading...",
                style: GoogleFonts.poppins(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
