
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/modules/attender/controller/attender_controller.dart';
import 'package:golden_hour_app/modules/doctors_profile/patient_details.dart';

class AssignedCasesScreen extends StatelessWidget {
  final String doctorName;

  const AssignedCasesScreen({super.key, required this.doctorName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NurseController>();
    
    // Mock data for assigned cases (replace with actual data in production)
    final List<Map<String, String>> assignedCases = [
      {
        'patientName': controller.name.value.isEmpty ? 'John Doe' : controller.name.value,
        'age': controller.age.value.isEmpty ? '30' : controller.age.value,
        'gender': controller.gender.value,
        'condition': 'Chest Injury',
        'criticality': 'High',
      },
      {
        'patientName': 'Jane Smith',
        'age': '45',
        'gender': 'Female',
        'condition': 'Fractured Arm',
        'criticality': 'Moderate',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('$doctorName\'s Cases'),
        backgroundColor: Colors.orange.shade400,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: assignedCases.length,
          itemBuilder: (context, index) {
            final patient = assignedCases[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(patient['patientName']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Age: ${patient['age']} • ${patient['gender']}'),
                    Text('Injury: ${patient['condition']}'),
                    Text(
                      'Criticality: ${patient['criticality']}',
                      style: TextStyle(
                        color: patient['criticality'] == 'Severe' 
                            ? Colors.red 
                            : Colors.orange,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(() => PatientDetailsScreen(
                    patientName: patient['patientName']!,
                    age: patient['age']!,
                    gender: patient['gender']!,
                    condition: patient['condition']!,
                    criticality: patient['criticality']!,
                    doctorName: doctorName,
                  ));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
