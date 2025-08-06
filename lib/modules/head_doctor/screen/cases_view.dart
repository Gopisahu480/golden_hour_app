import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/modules/head_doctor/controller/head_doctor_controller.dart';
import 'package:golden_hour_app/modules/head_doctor/models/doctor_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CasesView extends StatelessWidget {
  CasesView({super.key});

  final HeadDoctorController _controller = Get.find();
  final TextEditingController _searchController = TextEditingController();
  final RxString _searchQuery = ''.obs;
  final Rx<DateTime?> _selectedDate = Rx<DateTime?>(null);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          // Search Bar and Date Filter
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40, // chhoti height
                  width: 350, // chhoti width
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ), // andar ka padding
                      hintText: 'Search by patient name...',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                      ), // thoda chhota font
                      prefixIcon: const Icon(Icons.search, size: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.orange),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.orange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.deepOrange,
                          width: 2,
                        ),
                      ),
                    ),
                    onChanged: (value) => _searchQuery.value = value,
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          _selectedDate.value = pickedDate;
                        },
                        icon: const Icon(Icons.calendar_today),
                        label: Obx(
                          () => Text(
                            _selectedDate.value != null
                                ? _formatDate(_selectedDate.value!)
                                : 'Select Date',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _searchQuery.value = '';
                        _selectedDate.value = null;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Tab Bar
          TabBar(
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'Active Cases'),
              Tab(text: 'Completed Cases'),
            ],
          ),
          // Tab Bar View
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
      // Filter and sort cases
      final filteredCases =
          cases.where((medicalCase) {
            final matchesName = medicalCase.patientName.toLowerCase().contains(
              _searchQuery.value.toLowerCase(),
            );
            final matchesDate =
                _selectedDate.value == null ||
                (medicalCase.admissionDate.day == _selectedDate.value!.day &&
                    medicalCase.admissionDate.month ==
                        _selectedDate.value!.month &&
                    medicalCase.admissionDate.year ==
                        _selectedDate.value!.year);
            return matchesName && matchesDate;
          }).toList()..sort(
            (a, b) => b.admissionDate.compareTo(a.admissionDate),
          ); // Sort by latest date

      if (filteredCases.isEmpty) {
        return const Center(child: Text('No cases found'));
      }

      return ListView.builder(
        itemCount: filteredCases.length,
        itemBuilder: (context, index) {
          final medicalCase = filteredCases[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(medicalCase.patientName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Case Type: ${medicalCase.caseType}',
                    style: GoogleFonts.poppins(),
                  ),
                  Text(
                    'Admission Date: ${_formatDate(medicalCase.admissionDate)}',
                    style: GoogleFonts.poppins(),
                  ),
                  if (medicalCase.dischargeDate != null)
                    Text(
                      'Discharge Date: ${_formatDate(medicalCase.dischargeDate!)}',
                      style: GoogleFonts.poppins(),
                    ),
                ],
              ),
              trailing: Chip(
                label: Text(
                  medicalCase.status.toUpperCase(),
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                backgroundColor: medicalCase.status == 'active'
                    ? Colors.deepOrange
                    : Colors.green,
              ),
              onTap: () => _showCaseDetails(medicalCase),
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
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
                child: Text('Close', style: GoogleFonts.poppins()),
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
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
