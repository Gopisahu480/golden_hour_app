// lib/views/cases_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/modules/head_doctor/controller/head_doctor_controller.dart';
import 'package:golden_hour_app/modules/head_doctor/models/doctor_model.dart';

class CasesView extends StatelessWidget {
  CasesView({super.key});

  final HeadDoctorController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Active Cases'),
              Tab(text: 'Completed Cases'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildCasesList(_controller.activeCases),
                _buildCasesList(_controller.completedCases),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCasesList(RxList<MedicalCase> cases) {
    return Obx(() {
      if (cases.isEmpty) {
        return const Center(child: Text('No cases found'));
      }

      return ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          final medicalCase = cases[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(medicalCase.patientName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Case Type: ${medicalCase.caseType}'),
                  Text(
                    'Admission Date: ${_formatDate(medicalCase.admissionDate)}',
                  ),
                  if (medicalCase.dischargeDate != null)
                    Text(
                      'Discharge Date: ${_formatDate(medicalCase.dischargeDate!)}',
                    ),
                ],
              ),
              trailing: Chip(
                label: Text(
                  medicalCase.status.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: medicalCase.status == 'active'
                    ? Colors.deepOrange
                    : Colors.green,
              ),
              onTap: () {
                // Navigate to case details
                _showCaseDetails(medicalCase);
              },
            ),
          );
        },
      );
    });
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showCaseDetails(MedicalCase medicalCase) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Case Details',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildDetailRow('Patient Name', medicalCase.patientName),
            _buildDetailRow('Case Type', medicalCase.caseType),
            _buildDetailRow('Status', medicalCase.status),
            _buildDetailRow(
              'Admission Date',
              _formatDate(medicalCase.admissionDate),
            ),
            if (medicalCase.dischargeDate != null)
              _buildDetailRow(
                'Discharge Date',
                _formatDate(medicalCase.dischargeDate!),
              ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
