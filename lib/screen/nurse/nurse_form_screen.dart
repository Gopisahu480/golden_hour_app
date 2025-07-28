import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/nurse/end_trip_screen.dart';
import 'package:golden_hour_app/screen/nurse/notification_screen.dart';
import 'package:golden_hour_app/screen/nurse/utils/custome_appbar.dart';
import 'nurse_controller.dart';

class NurseFormScreen extends StatelessWidget {
  const NurseFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NurseController());

    return Scaffold(
      appBar: OrangeGradientAppBar(title: 'Nurse', notificationCount: 3),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter patient information and select the hospital that the ambulance is heading to.',
              ),
              const SizedBox(height: 20),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Name (optional)'),
                onChanged: (val) => controller.name.value = val,
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Age'),
                      onChanged: (val) => controller.age.value = val,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Obx(
                    () => Row(
                      children: [
                        const Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Radio(
                          value: 'Male',
                          groupValue: controller.gender.value,
                          onChanged: (val) => controller.gender.value = val!,
                        ),
                        const Text('Male'),
                        Radio(
                          value: 'Female',
                          groupValue: controller.gender.value,
                          onChanged: (val) => controller.gender.value = val!,
                        ),
                        const Text('Female'),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Text(
                "Tap to select the injured body part",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Stack(
                    // alignment: Alignment.topLeft,
                    children: [
                      Center(
                        child: Image.asset('assets/body.png', height: 200),
                      ),
                      const Positioned(
                        left: 159.5,
                        top: 26.5,
                        child: Icon(Icons.circle, color: Colors.red, size: 9),
                      ),
                      Positioned(
                        left: 174,
                        top: 20,
                        child: GestureDetector(
                          onTap: () {
                            // Add your desired tap action here
                          },
                          child: Text(
                            '-----> Head',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 166,
                        top: 53,
                        child: Icon(Icons.circle, color: Colors.red, size: 10),
                      ),
                      Positioned(
                        left: 190,
                        top: 47,
                        child: GestureDetector(
                          onTap: () {
                            // Add your desired tap action here
                          },
                          child: Text(
                            '-----> Chest',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 185,
                        top: 80,
                        child: Icon(Icons.circle, color: Colors.red, size: 6),
                      ),
                      Positioned(
                        left: 196,
                        top: 72,
                        child: GestureDetector(
                          onTap: () {
                            // Add your desired tap action here
                          },
                          child: Text(
                            '-> Left Hand',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 137.5,
                        top: 79.5,
                        child: Icon(Icons.circle, color: Colors.red, size: 6),
                      ),
                      Positioned(
                        right: 195,
                        top: 71,
                        child: GestureDetector(
                          onTap: () {
                            // Add your desired tap action here
                          },
                          child: Text(
                            'Right Hand <-',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 154,
                        top: 145.5,
                        child: Icon(Icons.circle, color: Colors.red, size: 6),
                      ),
                      Positioned(
                        right: 180,
                        top: 137.5,
                        child: GestureDetector(
                          onTap: () {
                            // Add your desired tap action here
                          },
                          child: Text(
                            'Right Leg <---',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 168,
                        top: 145.5,
                        child: Icon(Icons.circle, color: Colors.red, size: 6),
                      ),
                      Positioned(
                        left: 179,
                        top: 137.5,
                        child: GestureDetector(
                          onTap: () {
                            // Add your desired tap action here
                          },
                          child: Text(
                            '---> Left Leg',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text('Severity'),
              Obx(
                () => Column(
                  children: [
                    RadioListTile(
                      title: const Text('Mild'),
                      value: 'Mild',
                      groupValue: controller.severity.value,
                      onChanged: (val) => controller.severity.value = val!,
                    ),
                    RadioListTile(
                      title: const Text('Moderate'),
                      value: 'Moderate',
                      groupValue: controller.severity.value,
                      onChanged: (val) => controller.severity.value = val!,
                    ),
                    RadioListTile(
                      title: const Text('Severe'),
                      value: 'Severe',
                      groupValue: controller.severity.value,
                      onChanged: (val) => controller.severity.value = val!,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              const Text('Select Hospital'),
              Obx(
                () => DropdownButton<String>(
                  isExpanded: true,
                  value: controller.selectedHospital.value,
                  onChanged: (val) => controller.selectedHospital.value = val!,
                  items: controller.hospitals.map((hospital) {
                    return DropdownMenuItem(
                      value: hospital,
                      child: Text(hospital),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    // Navigate to NotificationScreen
                    Get.to(() => const NotificationScreen());
                    // Get.to(() => EndTripScreen());
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
