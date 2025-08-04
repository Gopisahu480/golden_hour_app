// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:golden_hour_app/screen/attender/attender_form_screen.dart';

// class OTPController extends GetxController {
//   var phoneNumber = ''.obs;
//   var otpCode = ''.obs;

//   void setPhoneNumber(String number) {
//     phoneNumber.value = number;
//   }

//   void verifyOtp(String otp, BuildContext context) {
//     otpCode.value = otp;
//     if (otp == '1234') {
//       showSuccessDialog(context);
//     } else {
//       Get.snackbar(
//         "Error",
//         "Invalid OTP",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }

//   void showSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Colors.orange[50],
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Icon(Icons.check_circle, color: Colors.orange, size: 80),
//                 const SizedBox(height: 15),
//                 const Text(
//                   "Successfully",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text("Your OTP has been verified."),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     Get.to(() => NurseFormScreen());
//                   },
//                   child: const Text("Ok"),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

//Login succesfully
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:golden_hour_app/screen/attender/attender_form_screen.dart';
// import 'package:golden_hour_app/screen/doctors/assign_patient_screen.dart';
// import 'dart:math';

// import 'package:golden_hour_app/screen/doctors/notification_screen.dart';

// class OTPController extends GetxController {
//   var phoneNumber = ''.obs;
//   var otpCode = ''.obs;
//   var generatedOtp = ''.obs;
//   var isOtpSent = false.obs;
//   var errorMessage = ''.obs;

//   // Predefined users with phone numbers and roles
//   final Map<String, String> users = {
//     '8435010816': 'EMT',
//     '9876543210': 'HeadDoctor',
//     '1234567890': 'Doctor',
//   };

//   // Simulate OTP generation
//   String generateOtp() {
//     final random = Random();
//     return (1000 + random.nextInt(9000)).toString(); // 4-digit OTP
//   }

//   void setPhoneNumber(String number) {
//     phoneNumber.value = number;
//     errorMessage.value = '';
//   }

//   void sendOtp(String phoneNumber, BuildContext context) {
//     if (phoneNumber.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
//       if (users.containsKey(phoneNumber)) {
//         generatedOtp.value = generateOtp();
//         isOtpSent.value = true;
//         errorMessage.value = '';
//         // Simulate sending OTP (in production, use an SMS service like Twilio)
//         print('Simulated OTP sent to +91$phoneNumber: ${generatedOtp.value}');
//         Get.snackbar(
//           'OTP Sent',
//           'OTP: ${generatedOtp.value} (Check console for demo)',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green,
//           colorText: Colors.white,
//         );
//       } else {
//         errorMessage.value = 'Phone number not registered';
//       }
//     } else {
//       errorMessage.value = 'Please enter a valid 10-digit phone number';
//     }
//   }

//   void verifyOtp(String otp, BuildContext context) {
//     otpCode.value = otp;
//     if (otp == generatedOtp.value) {
//       navigateToUserScreen(context);
//     } else {
//       Get.snackbar(
//         'Error',
//         'Invalid OTP',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }

//   void verifyPassword(String password, BuildContext context) {
//     if (password == '1234') {
//       navigateToUserScreen(context);
//     } else {
//       Get.snackbar(
//         'Error',
//         'Invalid Password',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }

//   void navigateToUserScreen(BuildContext context) {
//     final role = users[phoneNumber.value];
//     Get.snackbar(
//       'Success',
//       'Login Successful!',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.green,
//       colorText: Colors.white,
//     );
//     switch (role) {
//       case 'EMT':
//         Get.off(() => NurseFormScreen());
//         break;
//       case 'HeadDoctor':
//         Get.off(() => NotificationScreen());
//         break;
//       case 'Doctor':
//         Get.off(() => AssignPatientScreen());
//         break;
//       default:
//         Get.snackbar(
//           'Error',
//           'User role not found',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//     }
//   }

//   void resetOtp() {
//     isOtpSent.value = false;
//     otpCode.value = '';
//     errorMessage.value = '';
//     generatedOtp.value = '';
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/modules/attender/attender_form_screen.dart';
import 'package:golden_hour_app/modules/head_doctor/screen/assign_patient_screen.dart';
import 'package:golden_hour_app/modules/attender/controller/attender_controller.dart';
import 'package:golden_hour_app/modules/doctors_profile/doctor_profile.dart';
import 'dart:math';
import 'package:golden_hour_app/modules/head_doctor/screen/head_doctor_dashboard.dart';
import 'package:golden_hour_app/modules/head_doctor/services/doctor_service.dart';

class OTPController extends GetxController {
  final RxString phoneNumber = ''.obs;
  final RxString otpCode = ''.obs;
  final RxString generatedOtp = ''.obs;
  final RxBool isOtpSent = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool isLoading = false.obs;

  // Predefined users with phone numbers and roles
  final Map<String, String> users = {
    '8435010816': 'EMT',
    '9876543210': 'HeadDoctor',
    '1234567890': 'Doctor',
  };

  // Simulate OTP generation
  String generateOtp() {
    final random = Random();
    return (1000 + random.nextInt(9000)).toString(); // 4-digit OTP
  }

  void setPhoneNumber(String number) {
    phoneNumber.value = number;
    errorMessage.value = '';
  }

  Future<void> sendOtp(String phoneNumber, BuildContext context) async {
    try {
      isLoading(true);
      errorMessage.value = '';

      if (phoneNumber.length != 10 ||
          !RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
        errorMessage.value = 'Please enter a valid 10-digit phone number';
        return;
      }

      if (!users.containsKey(phoneNumber)) {
        errorMessage.value = 'Phone number not registered';
        return;
      }

      generatedOtp.value = generateOtp();
      isOtpSent.value = true;

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      // In production, use an SMS service like Twilio
      debugPrint(
        'Simulated OTP sent to +91$phoneNumber: ${generatedOtp.value}',
      );

      Get.snackbar(
        'OTP Sent',
        'OTP: ${generatedOtp.value} (Check console for demo)',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> verifyOtp(String otp, BuildContext context) async {
    try {
      isLoading(true);
      otpCode.value = otp;

      if (otp != generatedOtp.value) {
        throw Exception('Invalid OTP');
      }

      await navigateToUserScreen(context);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> verifyPassword(String password, BuildContext context) async {
    try {
      isLoading(true);

      if (password != '1234') {
        throw Exception('Invalid Password');
      }

      await navigateToUserScreen(context);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> navigateToUserScreen(BuildContext context) async {
    final role = users[phoneNumber.value];

    if (role == null) {
      throw Exception('User role not found');
    }

    // Get.snackbar(
    //   'Success',
    //   'Login Successful!',
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.green,
    //   colorText: Colors.white,
    // );

    switch (role) {
      case 'EMT':
        Get.offAll(() => const NurseFormScreen());
        break;
      case 'HeadDoctor':
        // Initialize DoctorService before navigating to dashboard
        await Get.putAsync(() => DoctorService().init());
        Get.offAll(() => HeadDoctorDashboard());
        break;
      case 'Doctor':
        Get.put(NurseController());
        //   Get.to(() => const AssignPatientScreen());
        Get.to(
          () => DoctorProfileScreen(
            doctorName:
                'Dr. Susan Clark', // Default doctor name (replace with dynamic lookup if needed)
            doctorPhone:
                '9812345678', // Default doctor phone (replace with dynamic lookup if needed)
          ),
        );
        break;
    }
  }

  void resetOtp() {
    isOtpSent.value = false;
    otpCode.value = '';
    errorMessage.value = '';
    generatedOtp.value = '';
  }
}
