import 'package:flutter/material.dart';
import 'package:golden_hour_app/screen/nurse/nurse_form_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.orange, size: 100),
            const SizedBox(height: 20),
            const Text(
              "Successfully",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Your OTP has been verified."),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NurseFormScreen()),
                );
              },
              child: const Text("Ok"),
            ),
          ],
        ),
      ),
    );
  }
}
