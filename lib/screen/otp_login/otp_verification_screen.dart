// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:golden_hour_app/screen/otp_controller.dart';

// class OTPVerificationScreen extends StatelessWidget {
//   const OTPVerificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<OTPController>();
//     final TextEditingController otpController = TextEditingController();

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.lock, size: 80, color: Colors.orange),
//             const SizedBox(height: 20),
//             const Text("Enter Verification Code", style: TextStyle(fontSize: 18)),
//             const SizedBox(height: 20),
//             TextField(
//               controller: otpController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 hintText: 'Enter OTP',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 controller.verifyOtp(otpController.text);
//               },
//               child: const Text("Submit"),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text("Resend Code"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/otp_login/otp_controller.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OTPController>();
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 80, color: Colors.orange),
            const SizedBox(height: 20),
            const Text("Enter Verification Code", 
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.verifyOtp(otpController.text, context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: const Text("Submit"),
            ),
            TextButton(
              onPressed: () {
                // Add resend OTP logic here
              },
              child: const Text("Resend Code"),
            ),
          ],
        ),
      ),
    );
  }
}