import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:golden_hour_app/modules/otp_login/otp_controller.dart';

class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OTPController());
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 12.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // const SizedBox(height: 20),
                // Animated logo with gradient
                Center(
                  child: Image.asset(
                    'assets/login.png',
                    width: 350,
                    // height: 200,
                  ),
                ).animate().fadeIn(duration: 600.ms),

                // const SizedBox(height: 24),
                // Title with professional typography
                Text(
                  "Welcome to Golden Hour",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(duration: 800.ms, delay: 200.ms),
                const SizedBox(height: 12),
                // Subtitle
                Text(
                  "Enter your mobile number to receive a verification code",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(duration: 800.ms, delay: 300.ms),
                const SizedBox(height: 40),
                // Phone input field with enhanced styling
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone_rounded,
                        color: Colors.orange.shade600,
                        size: 24,
                      ),
                      hintText: 'Enter 10-digit mobile number',
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      prefixText: '+91 ',
                      prefixStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ).animate().slideY(begin: 0.3, end: 0.0, duration: 600.ms),
                const SizedBox(height: 40),
                // Button with loading state
                Obx(
                  () => SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              if (phoneController.text.length == 10) {
                                controller.setPhoneNumber(phoneController.text);
                                Get.toNamed('/otp');
                              } else {
                                Get.snackbar(
                                  'Invalid Number',
                                  'Please enter a valid 10-digit mobile number',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red[400],
                                  colorText: Colors.white,
                                );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade600,
                        disabledBackgroundColor: Colors.orange.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                        shadowColor: Colors.orange.withOpacity(0.4),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: controller.isLoading.value
                          ? SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          : Text(
                              "Send OTP",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ).animate().fadeIn(duration: 800.ms, delay: 400.ms),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
