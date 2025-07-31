import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/doctors/notification_screen.dart';
import 'package:golden_hour_app/screen/attender/controller/attender_controller.dart';
import 'package:golden_hour_app/screen/head_doctor/controller/head_doctor_controller.dart';
import 'package:golden_hour_app/screen/head_doctor/screen/cases_view.dart';
import 'package:golden_hour_app/screen/head_doctor/screen/head_doctor_profile_view.dart';
import 'package:golden_hour_app/screen/head_doctor/screen/doctors_list_view.dart';
import 'package:golden_hour_app/screen/otp_login/mobile_number_screen.dart'; // Assumed login screen import

class HeadDoctorDashboard extends StatelessWidget {
  final HeadDoctorController _controller = Get.put(HeadDoctorController());

  HeadDoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
          title: Obx(
            () => Text(
              _controller.hospitalStats.value.hospitalName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black26,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 10,
          iconTheme: const IconThemeData(color: Colors.white, size: 28),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange[900]!,
                  Colors.orange[700]!,
                  Colors.orange[800]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Badge(child: Icon(Icons.notifications_outlined)),
              onPressed: () {
                Get.put(NurseController());
                Get.to(() => NotificationScreen());
              },
            ),
            const SizedBox(width: 8),
          ],
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.deepOrange[100],
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            tabs: const [
              Tab(icon: Icon(Icons.person), text: 'Profile'),
              Tab(icon: Icon(Icons.people), text: 'Doctors'),
              Tab(icon: Icon(Icons.medical_services), text: 'Cases'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange.shade900,
                      Colors.orange.shade700,
                      Colors.orange.shade500,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 0.5, 1.0], // Smooth gradient transition
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                accountName: const Text(
                  'Dr. Rajesh Sharma', // Replace with actual user name
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                accountEmail: Text(
                  'john.doe@example.com', // Replace with actual user email
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 44,
                    color: Colors.orange.shade900,
                  ),
                ),
                margin: EdgeInsets.zero,
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  DefaultTabController.of(context).animateTo(0);
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Doctors'),
                onTap: () {
                  DefaultTabController.of(context).animateTo(1);
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.medical_services),
                title: const Text('Cases'),
                onTap: () {
                  DefaultTabController.of(context).animateTo(2);
                  Navigator.pop(context); // Close the drawer
                },
              ),
              const Divider(),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                tileColor: Colors.red.shade50,
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.logout, color: Colors.red, size: 24),
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.red,
                ),
                onTap: () {
                  // Your logout logic
                  Get.offAll(() => MobileNumberScreen());
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [HeadDoctorProfileView(), DoctorsListView(), CasesView()],
        ),
      ),
    );
  }
}
