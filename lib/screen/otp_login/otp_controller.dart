import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/attender/attender_form_screen.dart';

class OTPController extends GetxController {
  var phoneNumber = ''.obs;
  var otpCode = ''.obs;
  

  void setPhoneNumber(String number) {
    phoneNumber.value = number;
  }

  void verifyOtp(String otp, BuildContext context) {
    otpCode.value = otp;
    if (otp == '1234') {
      showSuccessDialog(context);
    } else {
      Get.snackbar(
        "Error", 
        "Invalid OTP",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.orange[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.orange, size: 80),
                const SizedBox(height: 15),
                const Text(
                  "Successfully",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text("Your OTP has been verified."),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Get.to(() => NurseFormScreen());
                  },
                  child: const Text("Ok"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}