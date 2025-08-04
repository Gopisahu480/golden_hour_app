// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:golden_hour_app/screen/otp_login/otp_controller.dart';

// class MobileNumberScreen extends StatelessWidget {
//   const MobileNumberScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(OTPController());
//     final TextEditingController phoneController = TextEditingController();

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.phone_android, size: 80, color: Colors.orange),
//             const SizedBox(height: 20),
//             const Text(
//               "Enter your Mobile Number",
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: phoneController,
//               keyboardType: TextInputType.phone,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(10), // Max 10 digits
//                 FilteringTextInputFormatter.digitsOnly, // Only numbers allowed
//               ],
//               decoration: const InputDecoration(
//                 prefixIcon: Icon(Icons.phone),
//                 hintText: 'Enter mobile number',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 controller.setPhoneNumber(phoneController.text);
//                 Get.toNamed('/otp');
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange.shade400, // Set the button color
//               ),
//               child: const Text(
//                 "Verify",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/modules/otp_login/otp_controller.dart';

class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OTPController());
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                // Animated logo with gradient
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange.shade400, Colors.deepOrange],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.phone_android,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                // Title with better typography
                const Text(
                  "Login to Golden Hour",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                // Subtitle
                const Text(
                  "Enter your mobile number to continue",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                // Phone input field with better styling
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
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
                      prefixIcon: const Icon(
                        Icons.phone_rounded,
                        color: Colors.orange,
                      ),
                      hintText: 'Enter 10-digit mobile number',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      prefixText: '+91 ',
                      prefixStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Button without loading state
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
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
                      backgroundColor: Colors.orange[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      shadowColor: Colors.orange.withOpacity(0.3),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
