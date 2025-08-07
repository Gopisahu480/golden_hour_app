import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/modules/head_doctor/screen/notification_screen.dart';
import 'package:golden_hour_app/utils/body_parts_overlay.dart';
import 'package:golden_hour_app/utils/custome_appbar.dart';
import 'package:golden_hour_app/utils/custome_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
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
        'labelX': 210.0,
        'labelY': 155.0,
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
        'labelX': 199.5,
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
                      horizontal: 0.0,
                      vertical: 8.0,
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
                          color: Colors.redAccent,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Enter patient information and select the hospital for ambulance transport.',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade900,
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
                      labelStyle: GoogleFonts.poppins(
                        color: Colors.grey.shade400,
                        fontSize: 15,
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
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
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
                                  Text(
                                    'Male',
                                    style: GoogleFonts.poppins(fontSize: 12),
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
                                  Text(
                                    'Female',
                                    style: GoogleFonts.poppins(fontSize: 12),
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
                            labelStyle: GoogleFonts.poppins(
                              color: Colors.grey.shade400,
                              fontSize: 15,
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
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red, // Error border color
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red, // Focused error border color
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 10,
                            ),
                            errorStyle: GoogleFonts.poppins(
                              color: Colors.red, // Error text color
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
                    'Tap to select the injured body part :-',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange.shade900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BodyPartSelector(
                    controller: controller,
                    bodyParts: bodyPartData,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Severity',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        RadioListTile(
                          title: Text(
                            'Mild',
                            style: GoogleFonts.poppins(
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
                            style: GoogleFonts.poppins(
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
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: controller.severity.value == 'Severe'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: controller.severity.value == 'Severe'
                                  ? const Color.fromARGB(255, 209, 17, 3)
                                  : null,
                            ),
                          ),
                          value: 'Severe',
                          groupValue: controller.severity.value,
                          onChanged: (val) => controller.severity.value = val!,
                          activeColor: controller.severity.value == 'Severe'
                              ? const Color.fromARGB(255, 209, 17, 3)
                              : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Select Hospital',
                    style: GoogleFonts.poppins(
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
                              style: GoogleFonts.poppins(fontSize: 15),
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
                      child: Text(
                        'Submit',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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
        title: Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 80),
            Text(
              'Confirm Submission',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Name: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${details['name'] ?? '—'}'),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Gender: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${details['gender']}'),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Age: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${details['age']}'),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Body Part(s): ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${details['bodyParts']}'),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Severity: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${details['severity']}'),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Hospital: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${details['hospital']}'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Do you want to submit?',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel', style: GoogleFonts.poppins()),
            onPressed: () => Navigator.of(dialogContext).pop(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange.shade700,
            ),
            child: Text(
              'Submit',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
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
