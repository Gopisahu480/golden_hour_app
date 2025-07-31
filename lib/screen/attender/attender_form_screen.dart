// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:golden_hour_app/screen/nurse/end_trip_screen.dart';
// import 'package:golden_hour_app/screen/nurse/notification_screen.dart';
// import 'package:golden_hour_app/utils/custome_appbar.dart';
// import '../nurse/nurse_controller.dart';

// class NurseFormScreen extends StatelessWidget {
//   const NurseFormScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NurseController());

//     return Scaffold(
//       appBar: OrangeGradientAppBar(
//         title: 'Emergency Medical Staff',
//         notificationCount: 3,
//         showDrawerButton: true,
//         onDrawerPressed: () => Scaffold.of(context).openDrawer(),
//         // showBackButton: false,
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Enter patient information and select the hospital that the ambulance is heading to.',
//               ),
//               const SizedBox(height: 20),

//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Name (optional)'),
//                 onChanged: (val) => controller.name.value = val,
//               ),
//               const SizedBox(height: 20),

//               Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(labelText: 'Age*'),
//                       onChanged: (val) => controller.age.value = val,
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   Obx(
//                     () => Row(
//                       children: [
//                         const Text(
//                           'Gender*',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Radio(
//                           value: 'Male',
//                           groupValue: controller.gender.value,
//                           onChanged: (val) => controller.gender.value = val!,
//                         ),
//                         const Text('Male'),
//                         Radio(
//                           value: 'Female',
//                           groupValue: controller.gender.value,
//                           onChanged: (val) => controller.gender.value = val!,
//                         ),
//                         const Text('Female'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 25),
//               Text(
//                 "Tap to select the injured body part",
//                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Center(
//                 child: Container(
//                   width: double.infinity,
//                   // color: Colors.grey[200],
//                   child: Stack(
//                     // alignment: Alignment.topLeft,
//                     children: [
//                       Center(
//                         child: Image.asset('assets/body.png', height: 200),
//                       ),
//                       const Positioned(
//                         left: 159.5,
//                         top: 26.5,
//                         child: Icon(Icons.circle, color: Colors.red, size: 9),
//                       ),
//                       Positioned(
//                         left: 174,
//                         top: 20,
//                         child: GestureDetector(
//                           onTap: () {
//                             // Add your desired tap action here
//                           },
//                           child: Text(
//                             '-----> Head',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Positioned(
//                         left: 166,
//                         top: 53,
//                         child: Icon(Icons.circle, color: Colors.red, size: 10),
//                       ),
//                       Positioned(
//                         left: 190,
//                         top: 47,
//                         child: GestureDetector(
//                           onTap: () {
//                             // Add your desired tap action here
//                           },
//                           child: Text(
//                             '-----> Chest',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Positioned(
//                         left: 185,
//                         top: 80,
//                         child: Icon(Icons.circle, color: Colors.red, size: 6),
//                       ),
//                       Positioned(
//                         left: 196,
//                         top: 72,
//                         child: GestureDetector(
//                           onTap: () {
//                             // Add your desired tap action here
//                           },
//                           child: Text(
//                             '-> Left Hand',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Positioned(
//                         left: 137.5,
//                         top: 79.5,
//                         child: Icon(Icons.circle, color: Colors.red, size: 6),
//                       ),
//                       Positioned(
//                         right: 195,
//                         top: 71,
//                         child: GestureDetector(
//                           onTap: () {
//                             // Add your desired tap action here
//                           },
//                           child: Text(
//                             'Right Hand <-',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Positioned(
//                         left: 154,
//                         top: 145.5,
//                         child: Icon(Icons.circle, color: Colors.red, size: 6),
//                       ),
//                       Positioned(
//                         right: 180,
//                         top: 137.5,
//                         child: GestureDetector(
//                           onTap: () {
//                             // Add your desired tap action here
//                           },
//                           child: Text(
//                             'Right Leg <---',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Positioned(
//                         left: 168,
//                         top: 145.5,
//                         child: Icon(Icons.circle, color: Colors.red, size: 6),
//                       ),
//                       Positioned(
//                         left: 179,
//                         top: 137.5,
//                         child: GestureDetector(
//                           onTap: () {
//                             // Add your desired tap action here
//                           },
//                           child: Text(
//                             '---> Left Leg',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               const Text('Severity'),
//               Obx(
//                 () => Column(
//                   children: [
//                     RadioListTile(
//                       title: const Text('Mild'),
//                       value: 'Mild',
//                       groupValue: controller.severity.value,
//                       onChanged: (val) => controller.severity.value = val!,
//                     ),
//                     RadioListTile(
//                       title: const Text('Moderate'),
//                       value: 'Moderate',
//                       groupValue: controller.severity.value,
//                       onChanged: (val) => controller.severity.value = val!,
//                     ),
//                     RadioListTile(
//                       title: const Text('Severe'),
//                       value: 'Severe',
//                       groupValue: controller.severity.value,
//                       onChanged: (val) => controller.severity.value = val!,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               const Text('Select Hospital'),
//               Obx(
//                 () => DropdownButton<String>(
//                   isExpanded: true,
//                   value: controller.selectedHospital.value,
//                   onChanged: (val) => controller.selectedHospital.value = val!,
//                   items: controller.hospitals.map((hospital) {
//                     return DropdownMenuItem(
//                       value: hospital,
//                       child: Text(hospital),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SizedBox(height: 30),

//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                   ),
//                   onPressed: () {
//                     // Navigate to NotificationScreen
//                     Get.to(() => const NotificationScreen());
//                     // Get.to(() => EndTripScreen());
//                   },
//                   child: const Text(
//                     'OK',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:golden_hour_app/screen/doctors/end_trip_screen.dart';
// import 'package:golden_hour_app/screen/doctors/notification_screen.dart';
// import 'package:golden_hour_app/utils/body_parts_overlay.dart';
// import 'package:golden_hour_app/utils/custome_appbar.dart';
// import 'package:golden_hour_app/utils/custome_drawer.dart';
// import '../doctors/nurse_controller.dart';

// class NurseFormScreen extends StatelessWidget {
//   const NurseFormScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NurseController());
//     final List<Map<String, dynamic>> bodyPartData = [
//       {
//         'name': 'head',
//         'iconLeft': 160.0,
//         'iconTop': 30.0,
//         'labelX': 185.0,
//         'labelY': 12.0,
//         'alignRight': false,
//       },
//       {
//         'name': 'chest',
//         'iconLeft': 166.0,
//         'iconTop': 76.0,
//         'labelX': 192.0,
//         'labelY': 58.0,
//         'alignRight': false,
//       },
//       {
//         'name': 'stomach',
//         'iconLeft': 158.0,
//         'iconTop': 129.0,
//         'labelX': 214.0,
//         'labelY': 150.0,
//         'alignRight': true,
//       },
//       {
//         'name': 'leftHand',
//         'iconLeft': 197.0,
//         'iconTop': 115.0,
//         'labelX': 203.0,
//         'labelY': 95.0,
//         'alignRight': false,
//       },
//       {
//         'name': 'rightHand',
//         'iconLeft': 120.5,
//         'iconTop': 113.5,
//         'labelX': 204.0,
//         'labelY': 95.0,
//         'alignRight': true,
//       },
//       {
//         'name': 'rightLeg',
//         'iconLeft': 148.0,
//         'iconTop': 217.5,
//         'labelX': 182.0,
//         'labelY': 197.5,
//         'alignRight': true,
//       },
//       {
//         'name': 'leftLeg',
//         'iconLeft': 169.5,
//         'iconTop': 217.5,
//         'labelX': 185.0,
//         'labelY': 197.5,
//         'alignRight': false,
//       },
//     ];

//     return Scaffold(
//       appBar: OrangeGradientAppBar(
//         title: 'Emergency Medical Staff',
//         notificationCount: 3,
//         showDrawerButton: true,
//       ),
//       drawer: const CustomDrawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Enter patient information and select the hospital that the ambulance is heading to.',
//               ),
//               const SizedBox(height: 20),

//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Name (optional)'),
//                 onChanged: (val) => controller.name.value = val,
//               ),
//               const SizedBox(height: 20),

//               Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(labelText: 'Age*'),
//                       onChanged: (val) => controller.age.value = val,
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   Obx(
//                     () => Row(
//                       children: [
//                         const Text(
//                           'Gender*',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Radio(
//                           value: 'Male',
//                           groupValue: controller.gender.value,
//                           onChanged: (val) => controller.gender.value = val!,
//                         ),
//                         const Text('Male'),
//                         Radio(
//                           value: 'Female',
//                           groupValue: controller.gender.value,
//                           onChanged: (val) => controller.gender.value = val!,
//                         ),
//                         const Text('Female'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 25),
//               Text(
//                 "Tap to select the injured body part",
//                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               BodyPartSelector(controller: controller, bodyParts: bodyPartData),

//               //  Center(
//               //                 child: Container(
//               //                   width: double.infinity,
//               //                   child: Stack(
//               //                     children: [
//               //                       Center(
//               //                         child: Image.asset(
//               //                           'assets/body.png',
//               //                           width: double.infinity,
//               //                           height: 300,
//               //                           fit: BoxFit.cover,
//               //                         ),
//               //                       ),
//               //                       // Head
//               //                       Positioned(
//               //                         left: 159.5,
//               //                         top: 30.5,
//               //                         child: Obx(
//               //                           () => GestureDetector(
//               //                             onTap: () => controller.toggleBodyPart('head'),
//               //                             child: Icon(
//               //                               Icons.circle,
//               //                               color:
//               //                                   controller.selectedBodyParts.contains('head')
//               //                                   ? Colors.green
//               //                                   : Colors.red,
//               //                               size: 12,
//               //                             ),
//               //                           ),
//               //                         ),
//               //                       ),
//               //                       Positioned(
//               //                         left: 185,
//               //                         top: 12,
//               //                         child: Row(
//               //                           children: [
//               //                             Obx(
//               //                               () => Checkbox(
//               //                                 value: controller.selectedBodyParts.contains(
//               //                                   'head',
//               //                                 ),
//               //                                 onChanged: (bool? value) {
//               //                                   controller.toggleBodyPart('head');
//               //                                 },
//               //                                 activeColor: Colors.green,
//               //                               ),
//               //                             ),
//               //                             Text(
//               //                               'Head',
//               //                               style: TextStyle(
//               //                                 fontSize: 14,
//               //                                 fontWeight: FontWeight.bold,
//               //                               ),
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //                       // Chest
//               //                       Positioned(
//               //                         left: 166,
//               //                         top: 76,
//               //                         child: Obx(
//               //                           () => GestureDetector(
//               //                             onTap: () => controller.toggleBodyPart('chest'),
//               //                             child: Icon(
//               //                               Icons.circle,
//               //                               color:
//               //                                   controller.selectedBodyParts.contains('chest')
//               //                                   ? Colors.green
//               //                                   : Colors.red,
//               //                               size: 12,
//               //                             ),
//               //                           ),
//               //                         ),
//               //                       ),
//               //                       Positioned(
//               //                         left: 192,
//               //                         top: 58,
//               //                         child: Row(
//               //                           children: [
//               //                             Obx(
//               //                               () => Checkbox(
//               //                                 value: controller.selectedBodyParts.contains(
//               //                                   'chest',
//               //                                 ),
//               //                                 onChanged: (bool? value) {
//               //                                   controller.toggleBodyPart('chest');
//               //                                 },
//               //                                 activeColor: Colors.green,
//               //                               ),
//               //                             ),
//               //                             Text(
//               //                               'Chest',
//               //                               style: TextStyle(
//               //                                 fontSize: 14,
//               //                                 fontWeight: FontWeight.bold,
//               //                               ),
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //                       // stomach
//               //                       Positioned(
//               //                         left: 158.5,
//               //                         top: 129.5,
//               //                         child: Obx(
//               //                           () => GestureDetector(
//               //                             onTap: () => controller.toggleBodyPart('stomach'),
//               //                             child: Icon(
//               //                               Icons.circle,
//               //                               color:
//               //                                   controller.selectedBodyParts.contains(
//               //                                     'stomach',
//               //                                   )
//               //                                   ? Colors.green
//               //                                   : Colors.red,
//               //                               size: 11,
//               //                             ),
//               //                           ),
//               //                         ),
//               //                       ),
//               //                       Positioned(
//               //                         right: 214,
//               //                         top: 150,
//               //                         child: Row(
//               //                           children: [
//               //                             Text(
//               //                               'Stomach',
//               //                               style: TextStyle(
//               //                                 fontSize: 14,
//               //                                 fontWeight: FontWeight.bold,
//               //                               ),
//               //                             ),
//               //                             Obx(
//               //                               () => Checkbox(
//               //                                 value: controller.selectedBodyParts.contains(
//               //                                   'stomach',
//               //                                 ),
//               //                                 onChanged: (bool? value) {
//               //                                   controller.toggleBodyPart('stomach');
//               //                                 },
//               //                                 activeColor: Colors.green,
//               //                               ),
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //                       // Left Hand
//               //                       Positioned(
//               //                         left: 197,
//               //                         top: 115,
//               //                         child: Obx(
//               //                           () => GestureDetector(
//               //                             onTap: () => controller.toggleBodyPart('leftHand'),
//               //                             child: Icon(
//               //                               Icons.circle,
//               //                               color:
//               //                                   controller.selectedBodyParts.contains(
//               //                                     'leftHand',
//               //                                   )
//               //                                   ? Colors.green
//               //                                   : Colors.red,
//               //                               size: 11,
//               //                             ),
//               //                           ),
//               //                         ),
//               //                       ),
//               //                       Positioned(
//               //                         left: 203,
//               //                         top: 95,
//               //                         child: Row(
//               //                           children: [
//               //                             Obx(
//               //                               () => Checkbox(
//               //                                 value: controller.selectedBodyParts.contains(
//               //                                   'leftHand',
//               //                                 ),
//               //                                 onChanged: (bool? value) {
//               //                                   controller.toggleBodyPart('leftHand');
//               //                                 },
//               //                                 activeColor: Colors.green,
//               //                               ),
//               //                             ),
//               //                             Text(
//               //                               'Left Hand',
//               //                               style: TextStyle(
//               //                                 fontSize: 14,
//               //                                 fontWeight: FontWeight.bold,
//               //                               ),
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //                       // Right Hand
//               //                       Positioned(
//               //                         left: 120.5,
//               //                         top: 113.5,
//               //                         child: Obx(
//               //                           () => GestureDetector(
//               //                             onTap: () => controller.toggleBodyPart('rightHand'),
//               //                             child: Icon(
//               //                               Icons.circle,
//               //                               color:
//               //                                   controller.selectedBodyParts.contains(
//               //                                     'rightHand',
//               //                                   )
//               //                                   ? Colors.green
//               //                                   : Colors.red,
//               //                               size: 11,
//               //                             ),
//               //                           ),
//               //                         ),
//               //                       ),
//               //                       Positioned(
//               //                         right: 204,
//               //                         top: 95,
//               //                         child: Row(
//               //                           children: [
//               //                             Text(
//               //                               'Right Hand',
//               //                               style: TextStyle(
//               //                                 fontSize: 14,
//               //                                 fontWeight: FontWeight.bold,
//               //                               ),
//               //                             ),
//               //                             Obx(
//               //                               () => Checkbox(
//               //                                 value: controller.selectedBodyParts.contains(
//               //                                   'rightHand',
//               //                                 ),
//               //                                 onChanged: (bool? value) {
//               //                                   controller.toggleBodyPart('rightHand');
//               //                                 },
//               //                                 activeColor: Colors.green,
//               //                               ),
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //                       // Right Leg
//               //                       Positioned(
//               //                         left: 148,
//               //                         top: 217.5,
//               //                         child: Obx(
//               //                           () => GestureDetector(
//               //                             onTap: () => controller.toggleBodyPart('rightLeg'),
//               //                             child: Icon(
//               //                               Icons.circle,
//               //                               color:
//               //                                   controller.selectedBodyParts.contains(
//               //                                     'rightLeg',
//               //                                   )
//               //                                   ? Colors.green
//               //                                   : Colors.red,
//               //                               size: 11,
//               //                             ),
//               //                           ),
//               //                         ),
//               //                       ),
//               //                       Positioned(
//               //                         right: 182,
//               //                         top: 197.5,
//               //                         child: Row(
//               //                           children: [
//               //                             Text(
//               //                               'Right Leg',
//               //                               style: TextStyle(
//               //                                 fontSize: 14,
//               //                                 fontWeight: FontWeight.bold,
//               //                               ),
//               //                             ),
//               //                             Obx(
//               //                               () => Checkbox(
//               //                                 value: controller.selectedBodyParts.contains(
//               //                                   'rightLeg',
//               //                                 ),
//               //                                 onChanged: (bool? value) {
//               //                                   controller.toggleBodyPart('rightLeg');
//               //                                 },
//               //                                 activeColor: Colors.green,
//               //                               ),
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //                       // Left Leg
//               //                       Positioned(
//               //                         left: 169.5,
//               //                         top: 217.5,
//               //                         child: Obx(
//               //                           () => GestureDetector(
//               //                             onTap: () => controller.toggleBodyPart('leftLeg'),
//               //                             child: Icon(
//               //                               Icons.circle,
//               //                               color:
//               //                                   controller.selectedBodyParts.contains(
//               //                                     'leftLeg',
//               //                                   )
//               //                                   ? Colors.green
//               //                                   : Colors.red,
//               //                               size: 11,
//               //                             ),
//               //                           ),
//               //                         ),
//               //                       ),
//               //                       Positioned(
//               //                         left: 185,
//               //                         top: 197.5,
//               //                         child: Row(
//               //                           children: [
//               //                             Obx(
//               //                               () => Checkbox(
//               //                                 value: controller.selectedBodyParts.contains(
//               //                                   'leftLeg',
//               //                                 ),
//               //                                 onChanged: (bool? value) {
//               //                                   controller.toggleBodyPart('leftLeg');
//               //                                 },
//               //                                 activeColor: Colors.green,
//               //                               ),
//               //                             ),
//               //                             Text(
//               //                               'Left Leg',
//               //                               style: TextStyle(
//               //                                 fontSize: 14,
//               //                                 fontWeight: FontWeight.bold,
//               //                               ),
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //                     ],
//               //                   ),
//               //                 ),
//               //               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Severity',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Obx(
//                 () => Column(
//                   children: [
//                     RadioListTile(
//                       title: Text(
//                         'Mild',
//                         style: TextStyle(
//                           fontWeight: controller.severity.value == 'Mild'
//                               ? FontWeight.bold
//                               : FontWeight.normal,
//                           color: controller.severity.value == 'Mild'
//                               ? const Color.fromARGB(255, 248, 191, 4)
//                               : null,
//                         ),
//                       ),
//                       value: 'Mild',
//                       groupValue: controller.severity.value,
//                       onChanged: (val) => controller.severity.value = val!,
//                       activeColor: const Color.fromARGB(255, 248, 191, 4),
//                     ),
//                     RadioListTile(
//                       title: Text(
//                         'Moderate',
//                         style: TextStyle(
//                           fontWeight: controller.severity.value == 'Moderate'
//                               ? FontWeight.bold
//                               : FontWeight.normal,
//                           color: controller.severity.value == 'Moderate'
//                               ? Colors.orange
//                               : null,
//                         ),
//                       ),
//                       value: 'Moderate',
//                       groupValue: controller.severity.value,
//                       onChanged: (val) => controller.severity.value = val!,
//                       activeColor: controller.severity.value == 'Moderate'
//                           ? Colors.orange
//                           : null,
//                     ),
//                     RadioListTile(
//                       title: Text(
//                         'Severe',
//                         style: TextStyle(
//                           fontWeight: controller.severity.value == 'Severe'
//                               ? FontWeight.bold
//                               : FontWeight.normal,
//                           color: controller.severity.value == 'Severe'
//                               ? const Color.fromARGB(255, 240, 29, 14)
//                               : null,
//                         ),
//                       ),
//                       value: 'Severe',
//                       groupValue: controller.severity.value,
//                       onChanged: (val) => controller.severity.value = val!,
//                       activeColor: controller.severity.value == 'Severe'
//                           ? Colors.red
//                           : null,
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               const Text('Select Hospital'),
//               Obx(
//                 () => DropdownButton<String>(
//                   isExpanded: true,
//                   value: controller.selectedHospital.value,
//                   onChanged: (val) => controller.selectedHospital.value = val!,
//                   items: controller.hospitals.map((hospital) {
//                     return DropdownMenuItem(
//                       value: hospital,
//                       child: Text(hospital),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SizedBox(height: 30),

//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                   ),
//                   onPressed: () {
//                     Get.to(() => const NotificationScreen());
//                   },
//                   child: const Text(
//                     'OK',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/doctors/notification_screen.dart';
import 'package:golden_hour_app/utils/body_parts_overlay.dart';
import 'package:golden_hour_app/utils/custome_appbar.dart';
import 'package:golden_hour_app/utils/custome_drawer.dart';
import 'controller/attender_controller.dart';

class NurseFormScreen extends StatelessWidget {
  const NurseFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NurseController());
    final _formKey = GlobalKey<FormState>();

    final List<Map<String, dynamic>> bodyPartData = [
      {
        'name': 'head',
        'displayName': 'Head',
        'iconLeft': 160.0,
        'iconTop': 30.0,
        'labelX': 185.0,
        'labelY': 12.0,
        'alignRight': false,
      },
      {
        'name': 'chest',
        'displayName': 'Chest',
        'iconLeft': 166.0,
        'iconTop': 76.0,
        'labelX': 192.0,
        'labelY': 58.0,
        'alignRight': false,
      },
      {
        'name': 'stomach',
        'displayName': 'Stomach',
        'iconLeft': 158.0,
        'iconTop': 129.0,
        'labelX': 214.0,
        'labelY': 150.0,
        'alignRight': true,
      },
      {
        'name': 'leftHand',
        'displayName': 'Left Hand',
        'iconLeft': 197.0,
        'iconTop': 115.0,
        'labelX': 203.0,
        'labelY': 95.0,
        'alignRight': false,
      },
      {
        'name': 'rightHand',
        'displayName': 'Right Hand',
        'iconLeft': 120.5,
        'iconTop': 113.5,
        'labelX': 204.0,
        'labelY': 95.0,
        'alignRight': true,
      },
      {
        'name': 'rightLeg',
        'displayName': 'Right Leg',
        'iconLeft': 148.0,
        'iconTop': 217.5,
        'labelX': 182.0,
        'labelY': 197.5,
        'alignRight': true,
      },
      {
        'name': 'leftLeg',
        'displayName': 'Left Leg',
        'iconLeft': 169.5,
        'iconTop': 217.5,
        'labelX': 185.0,
        'labelY': 197.5,
        'alignRight': false,
      },
    ];

    return Scaffold(
      appBar: OrangeGradientAppBar(
        title: 'Emergency Medical Staff',
        notificationCount: 3,
        showDrawerButton: true,
      ),
      drawer: const CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Info Box
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
                    child: Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: Colors.orange,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Enter patient information and select the hospital for ambulance transport.',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange.shade900,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Name Field (Optional)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name (optional)',
                      labelStyle: TextStyle(
                        color: Colors.orange.shade700,
                        fontSize: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.orange.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.orange.shade700,
                          width: 2,
                        ),
                      ),
                    ),
                    onChanged: (val) => controller.name.value = val,
                  ),

                  const SizedBox(height: 24),

                  // Gender + Age Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender*',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange.shade900,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio(
                                    value: 'Male',
                                    groupValue: controller.gender.value,
                                    onChanged: (val) =>
                                        controller.gender.value = val!,
                                    activeColor: Colors.orange.shade700,
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  const Text(
                                    'Male',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(width: 8),
                                  Radio(
                                    value: 'Female',
                                    groupValue: controller.gender.value,
                                    onChanged: (val) =>
                                        controller.gender.value = val!,
                                    activeColor: Colors.orange.shade700,
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  const Text(
                                    'Female',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Age*',
                            labelStyle: TextStyle(
                              color: Colors.orange.shade700,
                              fontSize: 16,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.orange.shade200,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.orange.shade700,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 10,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Age is required';
                            }
                            return null;
                          },
                          onChanged: (val) => controller.age.value = val,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),
                  Text(
                    'Tap to select the injured body part',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange.shade900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  BodyPartSelector(
                    controller: controller,
                    bodyParts: bodyPartData,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Severity',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        RadioListTile(
                          title: Text(
                            'Mild',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: controller.severity.value == 'Mild'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: controller.severity.value == 'Mild'
                                  ? const Color.fromARGB(255, 248, 191, 4)
                                  : null,
                            ),
                          ),
                          value: 'Mild',
                          groupValue: controller.severity.value,
                          onChanged: (val) => controller.severity.value = val!,
                          activeColor: const Color.fromARGB(255, 248, 191, 4),
                        ),
                        RadioListTile(
                          title: Text(
                            'Moderate',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight:
                                  controller.severity.value == 'Moderate'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: controller.severity.value == 'Moderate'
                                  ? Colors.orange
                                  : null,
                            ),
                          ),
                          value: 'Moderate',
                          groupValue: controller.severity.value,
                          onChanged: (val) => controller.severity.value = val!,
                          activeColor: controller.severity.value == 'Moderate'
                              ? Colors.orange
                              : null,
                        ),
                        RadioListTile(
                          title: Text(
                            'Severe',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: controller.severity.value == 'Severe'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: controller.severity.value == 'Severe'
                                  ? const Color.fromARGB(255, 240, 29, 14)
                                  : null,
                            ),
                          ),
                          value: 'Severe',
                          groupValue: controller.severity.value,
                          onChanged: (val) => controller.severity.value = val!,
                          activeColor: controller.severity.value == 'Severe'
                              ? Colors.red
                              : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Select Hospital',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange.shade900,
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orange.shade200),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: controller.selectedHospital.value,
                        onChanged: (val) =>
                            controller.selectedHospital.value = val!,
                        items: controller.hospitals.map((hospital) {
                          return DropdownMenuItem(
                            value: hospital,
                            child: Text(
                              hospital,
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                        underline: const SizedBox(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.orange.shade700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                  //Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade700,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        shadowColor: Colors.orange.shade300,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final List<String> selectedPartsDisplay = bodyPartData
                              .where(
                                (part) => controller.selectedBodyParts.contains(
                                  part['name'],
                                ),
                              )
                              .map<String>(
                                (part) => part['displayName'] as String,
                              )
                              .toList();
                          final Map<String, dynamic> details = {
                            'name': controller.name.value,
                            'gender': controller.gender.value,
                            'age': controller.age.value,
                            'bodyParts': selectedPartsDisplay.join(', '),
                            'severity': controller.severity.value,
                            'hospital': controller.selectedHospital.value,
                          };

                          _showConfirmationPopup(context, details, () {
                            controller.selectedBodyPartsDisplay.value =
                                selectedPartsDisplay;
                            Get.to(() => const NotificationScreen());
                          });
                          // controller.selectedBodyPartsDisplay.value =
                          //     selectedPartsDisplay;
                          // Get.to(() => const NotificationScreen());
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showConfirmationPopup(
  BuildContext context,
  Map<String, dynamic> details,
  VoidCallback onConfirm,
) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Confirm Submission'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${details['name'] ?? '—'}'),
              Text('Gender: ${details['gender']}'),
              Text('Age: ${details['age']}'),
              Text('Body Part(s): ${details['bodyParts']}'),
              Text('Severity: ${details['severity']}'),
              Text('Hospital: ${details['hospital']}'),
              SizedBox(height: 12),
              Text(
                'Do you want to submit?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(dialogContext).pop(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange.shade700,
            ),
            child: Text('Submit'),
            onPressed: () {
              Navigator.of(dialogContext).pop();
              onConfirm();
            },
          ),
        ],
      );
    },
  );
}
