import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/nurse/utils/custome_appbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'nurse_controller.dart';

// class AssignPatientScreen extends StatelessWidget {
//   const AssignPatientScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<NurseController>();

//     // Doctor data: each with name and phone number
//     final List<Map<String, String>> doctors = [
//       {'name': 'Dr. Susan Clark', 'phone': '9812345678'},
//       {'name': 'Dr. James Wilson', 'phone': '9823456789'},
//       {'name': 'Dr. Patricia Miller', 'phone': '9834567890'},
//       {'name': 'Dr. Mark Allen', 'phone': '8435010816'},
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Assign Patient'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Patient Details', style: TextStyle(fontSize: 16, color: Colors.grey)),
//             const SizedBox(height: 8),
//             Text(controller.name.value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//             Text('Age : ${controller.age.value} • ${controller.gender.value}'),
//             const SizedBox(height: 4),
//             Row(
//               children: const [
//                 Text('Criticality: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                 Text('High', style: TextStyle(color: Colors.red)),
//               ],
//             ),
//             const Text('Injury: Chest'),
//             const SizedBox(height: 20),
//             const Text('Assign Doctor', style: TextStyle(fontSize: 16, color: Colors.grey)),
//             const SizedBox(height: 8),
//             GetBuilder<NurseController>(
//               builder: (_) => Column(
//                 children: List.generate(doctors.length, (index) {
//                   final doctor = doctors[index];
//                   final doctorName = doctor['name']!;
//                   final doctorPhone = doctor['phone']!;
//                   return ListTile(
//                     leading: CircleAvatar(child: Text(doctorName.split(' ')[1][0])),
//                     title: Text(doctorName),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.call, color: Colors.green),
//                           onPressed: () async {
//                             final Uri uri = Uri(scheme: 'tel', path: doctorPhone);
//                             if (await canLaunchUrl(uri)) {
//                               await launchUrl(uri);
//                             } else {
//                               Get.snackbar('Error', 'Cannot launch dialer');
//                             }
//                           },
//                         ),
//                         if (controller.selectedDoctor.value == doctorName)
//                           const Icon(Icons.check_circle, color: Colors.black),
//                       ],
//                     ),
//                     onTap: () {
//                       controller.selectedDoctor.value = doctorName;
//                       controller.update();
//                     },
//                   );
//                 }),
//               ),
//             ),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
//                 onPressed: () {
//                   Get.snackbar('Assigned', 'Assigned to ${controller.selectedDoctor.value}');
//                   Get.back(); // Optional: Go back after assigning
//                 },
//                 child: const Text('Assign'),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AssignPatientScreen extends StatelessWidget {
//   const AssignPatientScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<NurseController>();

//     final List<Map<String, String>> doctors = [
//       {'name': 'Dr. Susan Clark', 'phone': '9812345678'},
//       {'name': 'Dr. James Wilson', 'phone': '9823456789'},
//       {'name': 'Dr. Patricia Miller', 'phone': '9834567890'},
//       {'name': 'Dr. Mark Allen', 'phone': '8435010816'},
//     ];

//     return Scaffold(
//       appBar: OrangeGradientAppBar(
//   title: 'Assign Patient',
//    showBackButton: false, // Will never show back button
// ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Patient Details', style: TextStyle(fontSize: 16, color: Colors.grey)),
//             const SizedBox(height: 8),
//             Text(controller.name.value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//             Text('Age : ${controller.age.value} • ${controller.gender.value}'),
//             const SizedBox(height: 4),
//             Row(
//               children: const [
//                 Text('Criticality: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                 Text('High', style: TextStyle(color: Colors.red)),
//               ],
//             ),
//             const Text('Injury: Chest'),
//             const SizedBox(height: 20),
//             const Text('Assign Doctor', style: TextStyle(fontSize: 16, color: Colors.grey)),
//             const SizedBox(height: 8),
//             GetBuilder<NurseController>(
//               builder: (_) => Column(
//                 children: List.generate(doctors.length, (index) {
//                   final doctor = doctors[index];
//                   final doctorName = doctor['name']!;
//                   final doctorPhone = doctor['phone']!;
//                   return ListTile(
//                     leading: CircleAvatar(child: Text(doctorName.split(' ')[1][0])),
//                     title: Text(doctorName),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.call, color: Colors.green),
//                           onPressed: () async {
//                             final Uri uri = Uri(scheme: 'tel', path: doctorPhone);
//                             if (await canLaunchUrl(uri)) {
//                               await launchUrl(uri);
//                             } else {
//                               Get.snackbar('Error', 'Cannot launch dialer');
//                             }
//                           },
//                         ),
//                         if (controller.selectedDoctor.value == doctorName)
//                           const Icon(Icons.check_circle, color: Colors.black),
//                       ],
//                     ),
//                     onTap: () {
//                       controller.selectedDoctor.value = doctorName;
//                       controller.update();
//                     },
//                   );
//                 }),
//               ),
//             ),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
//                 onPressed: () {
//                   Get.snackbar('Assigned', 'Assigned to ${controller.selectedDoctor.value}');
//                   Get.back();
//                 },
//                 child: const Text('Assign'),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class AssignPatientScreen extends StatelessWidget {
  const AssignPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NurseController>();

    final List<Map<String, String>> doctors = [
      {'name': 'Dr. Susan Clark', 'phone': '9812345678'},
      {'name': 'Dr. James Wilson', 'phone': '9823456789'},
      {'name': 'Dr. Patricia Miller', 'phone': '9834567890'},
      {'name': 'Dr. Mark Allen', 'phone': '8435010816'},
    ];

    void _showAssignmentDialog(String doctorName) {
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
                  const Icon(
                    Icons.check_circle,
                    color: Colors.orange,
                    size: 80,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Assigned Successfully",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      text: "Patient assigned to ",
                      style: TextStyle(
                        color: Colors.black,
                      ), // normal text style
                      children: [
                        TextSpan(
                          text: doctorName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors
                                .blueGrey, // aap chahe to koi bhi color de sakte ho
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
                      Navigator.of(context).pop();
                      Get.back(); // Close the AssignPatientScreen
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

    return Scaffold(
      appBar: OrangeGradientAppBar(
        title: 'Assign Patient',
        showBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Patient Details',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              controller.name.value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('Age : ${controller.age.value} • ${controller.gender.value}'),
            const SizedBox(height: 4),
            Row(
              children: const [
                Text(
                  'Criticality: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('High', style: TextStyle(color: Colors.red)),
              ],
            ),
            const Text('Injury: Chest'),
            const SizedBox(height: 20),
            const Text(
              'Assign Doctor',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            GetBuilder<NurseController>(
              builder: (_) => Column(
                children: List.generate(doctors.length, (index) {
                  final doctor = doctors[index];
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
                        if (controller.selectedDoctor.value == doctorName)
                          const Icon(Icons.check_circle, color: Colors.black),
                      ],
                    ),
                    onTap: () {
                      controller.selectedDoctor.value = doctorName;
                      controller.update();
                    },
                  );
                }),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade400,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (controller.selectedDoctor.value.isEmpty) {
                    Get.snackbar('Error', 'Please select a doctor first');
                    return;
                  }
                  _showAssignmentDialog(controller.selectedDoctor.value);
                },
                child: const Text('Assign'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
