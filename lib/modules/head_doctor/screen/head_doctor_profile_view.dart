// lib/views/doctor_profile_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/modules/head_doctor/controller/head_doctor_controller.dart';
import 'package:golden_hour_app/modules/otp_login/mobile_number_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadDoctorProfileView extends StatelessWidget {
  HeadDoctorProfileView({super.key});

  final HeadDoctorController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() {
        final doctor = _controller.headDoctor.value;
        final stats = _controller.hospitalStats.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.person, // 👨‍⚕️ Doctor icon ka representative
                  size: 50,
                  color: Colors.blue.shade800,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                doctor.name,
                style: GoogleFonts.poppins(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                doctor.specialty,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildInfoCard('Hospital Stats', [
              _buildStatItem('Total Doctors', stats.totalDoctors.toString()),
              _buildStatItem('Active Cases', stats.activeCases.toString()),
              _buildStatItem(
                'Completed Cases',
                stats.completedCases.toString(),
              ),
            ]),
            const SizedBox(height: 20),
            _buildInfoCard('Contact Information', [
              _buildInfoItem(Icons.email, doctor.email),
              _buildInfoItem(Icons.phone, doctor.phone),
            ]),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.to(() => MobileNumberScreen());
                },
                icon: Icon(Icons.logout, color: Colors.white),
                label: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.poppins(fontSize: 14)),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 10),
          Text(text, style: GoogleFonts.poppins(fontSize: 14)),
        ],
      ),
    );
  }
}
