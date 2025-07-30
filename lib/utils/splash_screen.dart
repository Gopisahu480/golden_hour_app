import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/otp_login/mobile_number_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.orange,
          Colors.orange,
        ],
      ),
       childWidget: SizedBox(
        height: 200,
        width: 200,
        child: Image.asset("assets/AppLogo.png"), // Replace with your logo
      ),
      
      duration: const Duration(milliseconds: 2500),
      animationDuration: const Duration(milliseconds: 2000),
      onAnimationEnd: () => debugPrint("On Scale End"),
      nextScreen: MobileNumberScreen(),
    );
  }
}



// import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gif/gif.dart';
// import 'package:golden_hour_app/screen/otp_login/mobile_number_screen.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FlutterSplashScreen.scale(
//       gradient: const LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [Colors.orange, Colors.orange],
//       ),
//       childWidget: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Golden Hour App",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(
//               height: 200,
//               width: 200,
//               child: Image.asset(
//                 "assets/AppLogo.png",
//               ), // Replace with your logo
//             ),

//             SizedBox(height: 25),
//             Gif(
//               image: const AssetImage("assets/laoding_clock.gif"),
//               autostart: Autostart.loop,
//             ),
//           ],
//         ),
//       ),

//       duration: const Duration(milliseconds: 2500),
//       animationDuration: const Duration(milliseconds: 2000),
//       onAnimationEnd: () => debugPrint("On Scale End"),
//       nextScreen: MobileNumberScreen(),
//     );
//   }
// }
