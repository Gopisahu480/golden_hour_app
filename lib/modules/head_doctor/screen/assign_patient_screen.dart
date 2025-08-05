import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/utils/custome_appbar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../attender/controller/attender_controller.dart';

class AssignPatientScreen extends StatefulWidget {
  const AssignPatientScreen({super.key});

  @override
  State<AssignPatientScreen> createState() => _AssignPatientScreenState();
}

class _AssignPatientScreenState extends State<AssignPatientScreen> {
  final NurseController controller = Get.find();
  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. Susan Clark',
      'phone': '9812345678',
      'specialization': 'Dermatologist',
    },
    {
      'name': 'Dr. James Wilson',
      'phone': '9823456789',
      'specialization': 'Cardiologist',
    },
    {
      'name': 'Dr. Patricia Miller',
      'phone': '9834567890',
      'specialization': 'Neurologist',
    },
    {
      'name': 'Dr. Mark Allen',
      'phone': '8435010816',
      'specialization': 'Orthopedist',
    },
  ];

  String selectedDoctor = 'Dr. Susan Clark';

  void _showAssignmentDialog(String doctorName, String doctorPhone) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.orange[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 15),
              const Text(
                "Assigned Successfully",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: "Patient assigned to ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: doctorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade400,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  controller.selectedDoctor.value = doctorName;
                  controller.selectedDoctorPhone.value = doctorPhone;
                  Get.back(); // Close the dialog
                  Get.back(); // Go back to previous screen
                },
                child: const Text("Ok"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeGradientAppBar(
        title: 'Assign Patient',
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.shade200.withOpacity(0.5),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.local_hospital_outlined,
                        color: Colors.orange,
                        size: 28,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Assign Patient',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 37.0),
                    child: Text(
                      'You may assign this patient to a doctor',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange.shade800,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            patientDetailsCard(controller),
            const SizedBox(height: 24),
            const Text(
              "Available Doctors",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Column(
              children: doctors.map((doctor) {
                final doctorName = doctor['name']!;
                final doctorPhone = doctor['phone']!;
                final specialization = doctor['specialization']!;
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(doctorName.split(' ')[1][0]),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          specialization,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.call, color: Colors.green),
                          onPressed: () async {
                            final Uri uri = Uri(
                              scheme: 'tel',
                              path: doctorPhone,
                            );
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              Get.snackbar('Error', 'Cannot launch dialer');
                            }
                          },
                        ),
                        if (selectedDoctor == doctorName)
                          const Icon(Icons.check_circle, color: Colors.grey),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        selectedDoctor = doctorName;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (selectedDoctor.isEmpty) {
                    Get.snackbar('Error', 'Please select a doctor first');
                    return;
                  }
                  final selectedDoctorData = doctors.firstWhere(
                    (doc) => doc['name'] == selectedDoctor,
                    orElse: () => {'phone': ''},
                  );
                  _showAssignmentDialog(
                    selectedDoctor,
                    selectedDoctorData['phone']!,
                  );
                },
                child: const Text(
                  'Assign Patient',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget patientDetailsCard(NurseController controller) {
  return Obx(
    () => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 24),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Incoming Patient Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1.2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    controller.severity.value,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Name: ${controller.name.value}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.person_outline, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '${controller.age.value} years • ${controller.gender.value}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Medical Summary',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.medical_services,
                      size: 16,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Criticality: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      controller.severity.value,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.healing, size: 16, color: Colors.orange),
                    const SizedBox(width: 8),
                    const Text(
                      'Injury: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                      child: Text(
                        'Chest,Head,Left Leg,Head',
                        // controller.severity.value.isEmpty
                        //     ? 'Not specified'
                        //     : controller.severity.value,
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.orange,
                          size: 16,
                        ), // Clock icon
                        const SizedBox(width: 6), // Space between icon and text
                        const Text(
                          'ETA : 8 min',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
