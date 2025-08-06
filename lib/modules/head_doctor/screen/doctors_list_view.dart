// lib/views/doctors_list_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/modules/head_doctor/controller/head_doctor_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorsListView extends StatelessWidget {
  DoctorsListView({super.key});

  final HeadDoctorController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: _controller.doctorsList.length,
        itemBuilder: (context, index) {
          final doctor = _controller.doctorsList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30, // Optional: size set karne ke liye
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  Icons.person, // Replace with any desired icon
                  size: 30,
                  color: Colors.blue.shade800,
                ),
              ),

              title: Text(
                doctor.name,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(doctor.specialty, style: GoogleFonts.poppins()),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to doctor details if needed
              },
            ),
          );
        },
      );
    });
  }
}
