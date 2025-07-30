// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'nurse_controller.dart';

// class ReferPatientScreen extends StatefulWidget {
//   const ReferPatientScreen({super.key});

//   @override
//   State<ReferPatientScreen> createState() => _ReferPatientScreenState();
// }

// class _ReferPatientScreenState extends State<ReferPatientScreen> {
//   final NurseController controller = Get.find();
//   final List<String> hospitals = [
//     'Sunshine Hospital',
//     'Apollo Hospital',
//     'City Care Hospital',
//   ];

//   final List<String> doctors = [
//     'Dr. Rekha Gupta',
//     'Dr. Anand Patel',
//     'Dr. Alok Chatterjee',
//   ];

//   String selectedDoctor = 'Dr. Anand Patel';
//   String selectedHospital = 'Sunshine Hospital';
//   final TextEditingController reasonController = TextEditingController(
//     text: 'Confirm availability',
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Doctor App'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             const Text(
//               'You may refer this patient to another hospital',
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 24),
//             patientDetailsCard(controller),
//             const Text(
//               'Refer Patient',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),

//             // Dropdown: Hospital
//             const Text('Hospital'),
//             const SizedBox(height: 4),
//             DropdownButtonFormField<String>(
//               value: selectedHospital,
//               decoration: const InputDecoration(border: OutlineInputBorder()),
//               items: hospitals.map((hospital) {
//                 return DropdownMenuItem(value: hospital, child: Text(hospital));
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedHospital = value!;
//                 });
//               },
//             ),

//             const SizedBox(height: 16),

//             // Radio Buttons: Doctor
//             const Text("Head Doctor's"),
//             const SizedBox(height: 4),
//             Column(
//               children: doctors.map((doctor) {
//                 return RadioListTile<String>(
//                   title: Text(doctor),
//                   value: doctor,
//                   groupValue: selectedDoctor,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedDoctor = value!;
//                     });
//                   },
//                 );
//               }).toList(),
//             ),

//             const SizedBox(height: 16),

//             // Reason Input
//             const Text('Reason'),
//             const SizedBox(height: 4),
//             TextField(
//               controller: reasonController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Reason for referral',
//               ),
//             ),

//             const SizedBox(height: 24),

//             // Refer Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
//                 onPressed: () {
//                   controller.referredHospital.value = selectedHospital;
//                   controller.referredDoctor.value = selectedDoctor;
//                   controller.referralReason.value = reasonController.text;

//                   Get.snackbar(
//                     'Patient Referred',
//                     'To: $selectedDoctor\nAt: $selectedHospital',
//                     snackPosition: SnackPosition.BOTTOM,
//                   );

//                   Get.back();
//                 },
//                 child: const Text('Refer Patient'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget patientDetailsCard(NurseController controller) {
//   return Obx(
//     () => Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 2,
//       margin: const EdgeInsets.only(bottom: 24),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Incoming Patient Details',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const SizedBox(height: 12),
//             infoRow('Name', controller.name.value),
//             infoRow('Age', controller.age.value),
//             infoRow('Gender', controller.gender.value),
//             infoRow('Injury', controller.severity.value),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('8 min'),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 4,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.orange,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     controller.severity.value,
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget infoRow(String label, String value) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 6),
//     child: Row(
//       children: [
//         Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(width: 12),
//         Text(value),
//       ],
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/utils/custome_appbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'nurse_controller.dart';

class ReferPatientScreen extends StatefulWidget {
  const ReferPatientScreen({super.key});

  @override
  State<ReferPatientScreen> createState() => _ReferPatientScreenState();
}

class _ReferPatientScreenState extends State<ReferPatientScreen> {
  final NurseController controller = Get.find();
  final List<String> hospitals = [
    'Sunshine Hospital',
    'Apollo Hospital',
    'City Care Hospital',
  ];

  final List<Map<String, String>> doctors = [
    {'name': 'Dr. Rekha Gupta', 'phone': '9812345678'},
    {'name': 'Dr. Anand Patel', 'phone': '9823456789'},
    {'name': 'Dr. Alok Chatterjee', 'phone': '9834567890'},
  ];

  String selectedDoctor = 'Dr. Anand Patel';
  String selectedHospital = 'Sunshine Hospital';
  final TextEditingController reasonController = TextEditingController(
    text: 'Confirm availability',
  );

  void _showReferralConfirmation() {
    Get.dialog(
      AlertDialog(
        title: const Text('Patient Referral Confirmation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Patient Details:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            infoRow('Name', controller.name.value),
            infoRow('Age', controller.age.value),
            infoRow('Gender', controller.gender.value),
            infoRow('Injury', controller.severity.value),
            const SizedBox(height: 16),
            const Text(
              'Referral Details:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            infoRow('Hospital', selectedHospital),
            infoRow('Doctor', selectedDoctor),
            infoRow('Reason', reasonController.text),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {
              // Save the referral details
              controller.referredHospital.value = selectedHospital;
              controller.referredDoctor.value = selectedDoctor;
              controller.referralReason.value = reasonController.text;

              Get.back(); // Close the dialog
              Get.back(); // Go back to previous screen

              Get.snackbar(
                backgroundColor: Colors.orange.shade300,

                'Patient Referred Successfully',
                'To: $selectedDoctor\nAt: $selectedHospital',
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 3),
              );
            },
            child: const Text(
              'Confirm Referral',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeGradientAppBar(title: 'Doctor Refer Patient',showBackButton: false,),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'You may refer this patient to another hospital',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            patientDetailsCard(controller),
            const Text(
              'Refer Patient',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Dropdown: Hospital
            const Text('Hospital'),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: selectedHospital,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: hospitals.map((hospital) {
                return DropdownMenuItem(value: hospital, child: Text(hospital));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedHospital = value!;
                });
              },
            ),

            const SizedBox(height: 16),

            // List: Doctors with Phone Call Functionality
            const Text("Doctor's"),
            const SizedBox(height: 4),
            Column(
              children: doctors.map((doctor) {
                final doctorName = doctor['name']!;
                final doctorPhone = doctor['phone']!;
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(doctorName.split(' ')[1][0]),
                  ),
                  title: Text(doctorName),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.call, color: Colors.green),
                        onPressed: () async {
                          final Uri uri = Uri(scheme: 'tel', path: doctorPhone);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            Get.snackbar('Error', 'Cannot launch dialer');
                          }
                        },
                      ),
                      if (selectedDoctor == doctorName)
                        const Icon(Icons.check_circle, color: Colors.black),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      selectedDoctor = doctorName;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Reason Input
            const Text('Reason'),
            const SizedBox(height: 4),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Reason for referral',
              ),
            ),

            const SizedBox(height: 24),

            // Refer Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: _showReferralConfirmation,
                child: const Text(
                  'Refer Patient',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
            const Text(
              'Incoming Patient Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            infoRow('Name', controller.name.value),
            infoRow('Age', controller.age.value),
            infoRow('Gender', controller.gender.value),
            infoRow('Injury', controller.severity.value),
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
  );
}

Widget infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 12),
        Text(value),
      ],
    ),
  );
}
