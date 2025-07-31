// // views/end_trip_screen.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:golden_hour_app/screen/nurse/utils/custome_appbar.dart';

// class EndTripScreen extends StatelessWidget {
//   EndTripScreen({super.key});

//   final TextEditingController otpController = TextEditingController();

//   void _endTrip() {
//     final enteredOtp = otpController.text.trim();

//     if (enteredOtp.isEmpty) {
//       Get.snackbar(
//         'Error',
//         'Please enter the OTP.',
//         backgroundColor: Colors.redAccent,
//         colorText: Colors.white,
//       );
//     } else if (enteredOtp != "1234") {
//       // Mock OTP check, replace with API logic
//       Get.snackbar(
//         'Invalid',
//         'The OTP is incorrect.',
//         backgroundColor: Colors.orange,
//         colorText: Colors.white,
//       );
//     } else {
//       Get.snackbar(
//         'Success',
//         'Trip ended successfully.',
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//       );
//       // Add your logic here to update backend or navigate
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: OrangeGradientAppBar(
//         title: 'End Trip',
//         // leading: IconButton(
//         //   icon: const Icon(Icons.menu),
//         //   onPressed: () => Get.back(),
//         // ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             // Top illustration (you can use asset/image.network instead)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.local_hospital, size: 48),
//                 SizedBox(width: 12),
//                 Icon(Icons.arrow_forward, size: 32),
//                 SizedBox(width: 12),
//                 Icon(Icons.medical_services_outlined, size: 48),
//               ],
//             ),
//             const SizedBox(height: 32),
//             const Text(
//               'Enter the OTP provided by the receiving physician to end the trip.',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 32),
//             TextField(
//               controller: otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'OTP',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 32),
//             SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: _endTrip,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   'End Trip',
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// views/end_trip_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/attender/attender_form_screen.dart';
import 'package:golden_hour_app/utils/custome_appbar.dart'; // Import your NurseFormScreen

class EndTripScreen extends StatelessWidget {
  EndTripScreen({super.key});

  final TextEditingController otpController = TextEditingController();

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
                const Text("Trip ended successfully."),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade400,
                    foregroundColor: Colors.white,
                  ),
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

  void _endTrip(BuildContext context) {
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
      showSuccessDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeGradientAppBar(title: 'End Trip', showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Top illustration
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_hospital, size: 48),
                SizedBox(width: 12),
                Icon(Icons.arrow_forward, size: 32),
                SizedBox(width: 12),
                Image.asset(
                  'assets/Ambulance.png',
                  width: 88,
                  height: 88,
                  fit: BoxFit.cover,
                  color: Colors.black,
                ),
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
                onPressed: () => _endTrip(context),
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
