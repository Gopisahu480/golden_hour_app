// import 'package:flutter/material.dart';
// import 'package:golden_hour_app/screen/attender/attender_form_screen.dart';

// class SuccessScreen extends StatelessWidget {
//   const SuccessScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange[50],
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.check_circle, color: Colors.orange, size: 100),
//             const SizedBox(height: 20),
//             const Text(
//               "Successfully",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Text("Your OTP has been verified."),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => NurseFormScreen()),
//                 );
//               },
//               child: const Text("Ok"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:golden_hour_app/screen/otp_login/otp_controller.dart';

// class PasswordEntryScreen extends StatelessWidget {
//   const PasswordEntryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<OTPController>();
//     final TextEditingController passwordController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Enter Password")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.lock_outline, size: 80, color: Colors.orange),
//             const SizedBox(height: 20),
//             const Text("Enter your password", style: TextStyle(fontSize: 18)),
//             const SizedBox(height: 20),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 hintText: 'Password',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 controller.verifyOtp(passwordController.text, context);
//               },
//               child: const Text("Submit"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/modules/otp_login/otp_controller.dart';

class PasswordEntryScreen extends StatelessWidget {
  const PasswordEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OTPController controller = Get.find<OTPController>();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Login'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 80, color: Colors.orange),
            const SizedBox(height: 20),
            const Text(
              "Enter Password",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Enter Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.verifyPassword(passwordController.text, context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: const Text("Submit"),
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Back to OTP Login"),
            ),
          ],
        ),
      ),
    );
  }
}