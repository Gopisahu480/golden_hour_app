import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/modules/head_doctor/screen/assign_patient_screen.dart';
import 'package:golden_hour_app/utils/custome_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../attender/controller/attender_controller.dart';

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
    {
      'name': 'Dr. Rekha Gupta',
      'phone': '9812345678',
      'specialization': 'Dermatologist',
    },
    {
      'name': 'Dr. Anand Patel',
      'phone': '9823456789',
      'specialization': 'Cardiologist',
    },
    {
      'name': 'Dr. Alok Chatterjee',
      'phone': '9834567890',
      'specialization': 'Neurologist',
    },
  ];

  String selectedDoctor = 'Dr. Anand Patel';
  String selectedHospital = 'Sunshine Hospital';
  final TextEditingController reasonController = TextEditingController();

  void _showReferralConfirmation() {
    Get.dialog(
      AlertDialog(
        title: const Text('Patient Referral Confirmation'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Patient Details:',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              infoRow('Name', controller.name.value),
              infoRow('Age', controller.age.value),
              infoRow('Gender', controller.gender.value),
              infoRow('Injury', controller.severity.value),
              infoRow('Reason', reasonController.text),
              const SizedBox(height: 16),
              Text(
                'Referral Details:',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              infoRow('Hospital', selectedHospital),
              infoRow('Doctor', selectedDoctor),
              infoRow(
                'Specialization',
                doctors.firstWhere(
                      (doc) => doc['name'] == selectedDoctor,
                    )['specialization'] ??
                    '',
              ),
            ],
          ),
        ),
        actions: <Widget>[
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
                'Patient Referred Successfully',
                'To: $selectedDoctor\nAt: $selectedHospital',
                backgroundColor: Colors.orange.shade300,
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 3),
              );
            },
            child: Text(
              'Confirm Referral',
              style: GoogleFonts.poppins(
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
      appBar: OrangeGradientAppBar(
        title: 'Doctor Refer Patient',
        showBackButton: false,
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
                        'Referral Option',
                        style: GoogleFonts.poppins(
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
                      'You may refer this patient to another hospital',
                      style: GoogleFonts.poppins(
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

            // Reason Input
            Text(
              'Reason',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Reason for referral',
                hintStyle: GoogleFonts.poppins(fontSize: 15),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 14),

            // Dropdown: Hospital
            Text(
              'Hospital',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: selectedHospital,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: hospitals.map((hospital) {
                return DropdownMenuItem(
                  value: hospital,
                  child: Text(
                    hospital,
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedHospital = value!;
                });
              },
            ),

            const SizedBox(height: 16),

            // List: Doctors with Phone Call Functionality
            Text(
              "Available Doctors",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
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
                      child: Text(
                        doctorName.split(' ')[1][0],
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          specialization,
                          style: GoogleFonts.poppins(
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

            // Refer Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: _showReferralConfirmation,
                child: Text(
                  'Refer Patient',
                  style: GoogleFonts.poppins(
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

Widget infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 12),
        Flexible(child: Text(value)),
      ],
    ),
  );
}





//if doctor list show after the hospital  select
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:golden_hour_app/modules/head_doctor/screen/assign_patient_screen.dart';
// import 'package:golden_hour_app/utils/custome_appbar.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../attender/controller/attender_controller.dart';

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

//   final List<Map<String, String>> doctors = [
//     {
//       'name': 'Dr. Rekha Gupta',
//       'phone': '9812345678',
//       'specialization': 'Dermatologist',
//     },
//     {
//       'name': 'Dr. Anand Patel',
//       'phone': '9823456789',
//       'specialization': 'Cardiologist',
//     },
//     {
//       'name': 'Dr. Alok Chatterjee',
//       'phone': '9834567890',
//       'specialization': 'Neurologist',
//     },
//   ];

//   String? selectedHospital; // Changed to nullable String
//   String selectedDoctor = 'Dr. Anand Patel';
//   final TextEditingController reasonController = TextEditingController();

//   void _showReferralConfirmation() {
//     if (selectedHospital == null) {
//       Get.snackbar('Error', 'Please select a hospital');
//       return;
//     }
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Patient Referral Confirmation'),
//         content: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                Text(
//                 'Patient Details:',
//                 style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//               ),
//               infoRow('Name', controller.name.value),
//               infoRow('Age', controller.age.value),
//               infoRow('Gender', controller.gender.value),
//               infoRow('Injury', controller.severity.value),
//               infoRow('Reason', reasonController.text),
//               const SizedBox(height: 16),
//                Text(
//                 'Referral Details:',
//                 style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//               ),
//               infoRow('Hospital', selectedHospital!),
//               infoRow('Doctor', selectedDoctor),
//               infoRow(
//                 'Specialization',
//                 doctors.firstWhere(
//                       (doc) => doc['name'] == selectedDoctor,
//                     )['specialization'] ??
//                     '',
//               ),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
//             onPressed: () {
//               controller.referredHospital.value = selectedHospital!;
//               controller.referredDoctor.value = selectedDoctor;
//               controller.referralReason.value = reasonController.text;

//               Get.back();
//               Get.back();

//               Get.snackbar(
//                 'Patient Referred Successfully',
//                 'To: $selectedDoctor\nAt: $selectedHospital',
//                 backgroundColor: Colors.orange.shade300,
//                 snackPosition: SnackPosition.BOTTOM,
//                 duration: const Duration(seconds: 3),
//               );
//             },
//             child:  Text(
//               'Confirm Referral',
//               style: GoogleFonts.poppins(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: OrangeGradientAppBar(
//         title: 'Doctor Refer Patient',
//         showBackButton: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             Container(
//               margin: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.orange.shade50,
//                 borderRadius: BorderRadius.circular(12.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.orange.shade200.withOpacity(0.5),
//                     blurRadius: 6,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//                 border: Border.all(color: Colors.orange.shade200),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Icon(
//                         Icons.local_hospital_outlined,
//                         color: Colors.orange,
//                         size: 28,
//                       ),
//                       const SizedBox(width: 10),
//                       Text(
//                         'Referral Option',
//                         style: GoogleFonts.poppins(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.orange.shade900,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 37.0),
//                     child: Text(
//                       'You may refer this patient to another hospital',
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         color: Colors.orange.shade800,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//             patientDetailsCard(controller),

//             // Reason Input
//              Text('Reason', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             TextField(
//               controller: reasonController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Reason for referral',
//               ),
//               maxLines: 3,
//             ),
//             const SizedBox(height: 15),
//             // Dropdown: Hospital
//              Text(
//               'Hospital',
//               style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 4),
//             DropdownButtonFormField<String>(
//               value: selectedHospital,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Select a hospital',
//               ),
//               items: hospitals.map((hospital) {
//                 return DropdownMenuItem(value: hospital, child: Text(hospital));
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedHospital = value;
//                   // Reset selectedDoctor when hospital changes
//                   selectedDoctor = doctors[0]['name']!;
//                 });
//               },
//             ),
//             const SizedBox(height: 16),
//             // Doctor List: Show only if a hospital is selected
//             if (selectedHospital != null) ...[
//                Text(
//                 "Available Doctors",
//                 style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 4),
//               Column(
//                 children: doctors.map((doctor) {
//                   final doctorName = doctor['name']!;
//                   final doctorPhone = doctor['phone']!;
//                   final specialization = doctor['specialization']!;
//                   return Card(
//                     margin: const EdgeInsets.symmetric(vertical: 4),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         child: Text(doctorName.split(' ')[1][0]),
//                       ),
//                       title: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             doctorName,
//                             style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             specialization,
//                             style: GoogleFonts.poppins(
//                               fontSize: 12,
//                               color: Colors.grey.shade600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.call, color: Colors.green),
//                             onPressed: () async {
//                               final Uri uri = Uri(
//                                 scheme: 'tel',
//                                 path: doctorPhone,
//                               );
//                               if (await canLaunchUrl(uri)) {
//                                 await launchUrl(uri);
//                               } else {
//                                 Get.snackbar('Error', 'Cannot launch dialer');
//                               }
//                             },
//                           ),
//                           if (selectedDoctor == doctorName)
//                             const Icon(Icons.check_circle, color: Colors.grey),
//                         ],
//                       ),
//                       onTap: () {
//                         setState(() {
//                           selectedDoctor = doctorName;
//                         });
//                       },
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],

//             const SizedBox(height: 24),

//             // Refer Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 onPressed: _showReferralConfirmation,
//                 child: Text(
//                   'Refer Patient',
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget infoRow(String label, String value) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 6),
//     child: Row(
//       children: [
//         SizedBox(
//           width: 80,
//           child: Text(
//             label,
//             style:  GoogleFonts.poppins(fontWeight: FontWeight.bold),
//           ),
//         ),
//         const SizedBox(width: 12),
//         Flexible(child: Text(value)),
//       ],
//     ),
//   );
// }