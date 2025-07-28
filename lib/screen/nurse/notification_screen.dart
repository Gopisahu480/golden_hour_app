import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/nurse/assign_patient_screen.dart';
import 'package:golden_hour_app/screen/nurse/refer_patient_screen.dart';
import 'package:golden_hour_app/screen/nurse/utils/custome_appbar.dart';
import 'nurse_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NurseController>(); // Reuse the same controller

    return Scaffold(
      appBar: OrangeGradientAppBar(
        title: 'Head Doctor Notification',
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () => Get.back(),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'An ambulance is bringing a patient to your hospital',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            Obx(
              () => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'There is an incoming Patient',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      _infoRow('Name', controller.name.value),
                      _infoRow('Age', controller.age.value),
                      _infoRow('Gender', controller.gender.value),
                      _infoRow('Injury', controller.severity.value),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('8 min'),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              controller.severity.value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48, // You can set a fixed height if needed
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const AssignPatientScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          'Assign to Case',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12), // Space between the buttons
                  Expanded(
                    child: SizedBox(
                      height: 48, // Match heights
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const ReferPatientScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blue, // Change color as you like
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          'Refer Case',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 12),
          Text(value),
        ],
      ),
    );
  }
}
