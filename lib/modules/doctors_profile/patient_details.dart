import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientDetailsScreen extends StatelessWidget {
  final String patientName;
  final String age;
  final String gender;
  final String condition;
  final String criticality;
  final String doctorName;

  const PatientDetailsScreen({
    super.key,
    required this.patientName,
    required this.age,
    required this.gender,
    required this.condition,
    required this.criticality,
    required this.doctorName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
        backgroundColor: Colors.orange.shade400,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Patient Information',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              patientName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('Age: $age • $gender'),
            const SizedBox(height: 4),
            Text(
              'Criticality: $criticality',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: criticality == 'Severe' ? Colors.red : Colors.orange,
              ),
            ),
            Text('Condition: $condition'),
            const SizedBox(height: 20),
            const Text(
              'Assigned Doctor',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: CircleAvatar(child: Text(doctorName.split(' ')[1][0])),
              title: Text(doctorName),
              subtitle: const Text('General Medicine'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade400,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Get.back(),
                child: const Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
