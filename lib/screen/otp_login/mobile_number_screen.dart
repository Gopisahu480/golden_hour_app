import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/otp_login/otp_controller.dart';

class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OTPController());
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone_android, size: 80, color: Colors.orange),
            const SizedBox(height: 20),
            const Text(
              "Enter your Mobile Number",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10), // Max 10 digits
                FilteringTextInputFormatter.digitsOnly, // Only numbers allowed
              ],
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: 'Enter mobile number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.setPhoneNumber(phoneController.text);
                Get.toNamed('/otp');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade400, // Set the button color
              ),
              child: const Text(
                "Verify",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
