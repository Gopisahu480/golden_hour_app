import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/otp_login/mobile_number_screen.dart';
import 'package:golden_hour_app/screen/otp_login/otp_verification_screen.dart';
import 'package:golden_hour_app/screen/otp_login/success_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OTP Login UI',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MobileNumberScreen()),
        GetPage(name: '/otp', page: () => const OTPVerificationScreen()),
        GetPage(name: '/success', page: () => const SuccessScreen()),
      ],
    );
  }
}

// // main.dart

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'screen/nurse/nurse_form_screen.dart ';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Nurse Form',
//       debugShowCheckedModeBanner: false,
//       home: const NurseFormScreen(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:golden_hour_app/screen/login_page.dart';
// import 'package:golden_hour_app/screen/otp_login/auth_controller.dart';
// import 'screen/nurse/nurse_form_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(AuthController()); // Initialize AuthController
    
//     return GetMaterialApp(
//       title: 'Nurse Form',
//       debugShowCheckedModeBanner: false,
//       home: const AuthWrapper(), // Changed to AuthWrapper
//     );
//   }
// }

// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authController = Get.find<AuthController>();
    
//     return Obx(() {
//       if (authController.isLoading.value) {
//         return const Scaffold(
//           body: Center(child: CircularProgressIndicator()),
//         );
//       }
//       return authController.user.value != null 
//           ? const NurseFormScreen() 
//           :  LoginPage();
//     });
//   }
// }