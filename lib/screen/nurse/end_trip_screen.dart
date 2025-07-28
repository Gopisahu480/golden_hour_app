// views/end_trip_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/nurse/utils/custome_appbar.dart';

class EndTripScreen extends StatelessWidget {
  EndTripScreen({super.key});

  final TextEditingController otpController = TextEditingController();

  void _endTrip() {
    final enteredOtp = otpController.text.trim();

    if (enteredOtp.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter the OTP.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } else if (enteredOtp != "1234") {
      // Mock OTP check, replace with API logic
      Get.snackbar(
        'Invalid',
        'The OTP is incorrect.',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Success',
        'Trip ended successfully.',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // Add your logic here to update backend or navigate
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeGradientAppBar(
        title: 'End Trip',
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () => Get.back(),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Top illustration (you can use asset/image.network instead)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.local_hospital, size: 48),
                SizedBox(width: 12),
                Icon(Icons.arrow_forward, size: 32),
                SizedBox(width: 12),
                Icon(Icons.medical_services_outlined, size: 48),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Enter the OTP provided by the receiving physician to end the trip.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _endTrip,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'End Trip',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
