// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:golden_hour_app/screen/doctors_profile/assigned_cases.dart';

// class DoctorProfileScreen extends StatelessWidget {
//   final String doctorName;
//   final String doctorPhone;

//   const DoctorProfileScreen({
//     super.key,
//     required this.doctorName,
//     required this.doctorPhone,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(doctorName),
//         backgroundColor: Colors.orange.shade400,
//         foregroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               child: Text(
//                 doctorName.split(' ')[1][0],
//                 style: const TextStyle(fontSize: 40),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               doctorName,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Phone: $doctorPhone',
//               style: const TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Specialization',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const Text(
//               'General Medicine',
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Hospital',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const Text(
//               'Raipur General Hospital',
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange.shade400,
//                   foregroundColor: Colors.white,
//                 ),
//                 onPressed: () {
//                   Get.to(() => AssignedCasesScreen(doctorName: doctorName));
//                 },
//                 child: const Text('View Assigned Cases'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_hour_app/screen/doctors_profile/assigned_cases.dart';
import 'package:golden_hour_app/screen/otp_login/mobile_number_screen.dart';
import 'package:golden_hour_app/utils/custome_appbar.dart';

class DoctorProfileScreen extends StatelessWidget {
  final String doctorName;
  final String doctorPhone;

  const DoctorProfileScreen({
    super.key,
    required this.doctorName,
    required this.doctorPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeGradientAppBar(
        title: 'Doctor Profile',
        notificationCount: 3,
        showDrawerButton: true,
      ),
      drawer: Drawer(
        elevation: 16.0, // Subtle shadow for depth
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
              accountName: Text(
                 doctorName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              accountEmail: Text(
                'sk@example.com', // Replace with actual user email
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
            _buildListTile(
              context,
              icon: Icons.person,
              title: 'Profile',
              onTap: () {
                Get.to(
                  () => DoctorProfileScreen(doctorName: '', doctorPhone: ''),
                ); // Navigate to login screen
              },
            ),
            _buildListTile(
              context,
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.pop(context); // Close drawer
                // Navigate to settings screen if needed
              },
            ),
            _buildListTile(
              context,
              icon: Icons.history,
              title: 'Assigned Cases',
              onTap: () {
                Get.to(
                  AssignedCasesScreen(doctorName: ''),
                ); // Navigate to history screen
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 16,
              endIndent: 16,
              color: Colors.grey,
            ),
            _buildListTile(
              context,
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                Get.to(() => MobileNumberScreen()); // Navigate to login screen
              },
              textColor: Colors.red.shade600, // Red color for logout
              iconColor: Colors.red.shade600,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade100, Colors.orange.shade50],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.orange.shade200,
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    doctorName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade600,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'General Medicine',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Contact Information
            _buildSectionCard(
              title: "Contact Information",
              icon: Icons.contact_phone,
              children: [
                _buildInfoRow(Icons.phone, "Phone", doctorPhone),
                _buildInfoRow(
                  Icons.location_on,
                  "Hospital",
                  "Raipur General Hospital",
                ),
                _buildInfoRow(
                  Icons.access_time,
                  "Availability",
                  "Mon-Sat, 9 AM - 5 PM",
                ),
                _buildInfoRow(
                  Icons.email,
                  "Email",
                  "doctor@raipurhospital.org",
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Experience
            _buildSectionCard(
              title: "Professional Experience",
              icon: Icons.work_history,
              children: [
                _buildExperienceItem(
                  "10+ Years of Practice",
                  "Experienced in diagnosing and treating a wide range of acute and chronic illnesses in adult patients.",
                ),
                _buildExperienceItem(
                  "5000+ Patients Treated",
                  "Managed diverse cases, from routine check-ups to critical care, with a focus on patient outcomes.",
                ),
                _buildExperienceItem(
                  "Hospital Leadership",
                  "Served as head of the General Medicine department, coordinating multidisciplinary teams.",
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Statistics
            _buildSectionCard(
              title: "Performance Statistics",
              icon: Icons.analytics,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        "Avg. Consultation Time",
                        "15 min",
                        Colors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        "Patient Satisfaction",
                        "95%",
                        Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        "Cases This Month",
                        "120",
                        Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard("Rating", "4.8/5", Colors.purple),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Assigned Cases Button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.to(() => AssignedCasesScreen(doctorName: doctorName));
                },
                icon: Icon(Icons.assessment, color: Colors.white),
                label: Text(
                  'View Assigned Cases',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Logout Button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                icon: Icon(Icons.logout, color: Colors.white),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
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

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.logout, color: Colors.red.shade600),
              const SizedBox(width: 8),
              Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to logout from your account?',
            style: TextStyle(color: Colors.grey[600]),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Replace with your desired logout navigation
                Get.offAllNamed('/login'); // Assuming a named route for login
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.orange.shade600, size: 24),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Text(
            "$label: ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Expanded(
            child: Text(value, style: TextStyle(color: Colors.grey[800])),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Colors.orange.shade700,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildExperienceItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

Widget _buildListTile(
  BuildContext context, {
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  Color? textColor,
  Color? iconColor,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    leading: Icon(icon, color: iconColor ?? Colors.grey.shade700, size: 24),
    title: Text(
      title,
      style: TextStyle(
        color: textColor ?? Colors.grey.shade900,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    onTap: onTap,
    hoverColor: Colors.orange.shade100.withOpacity(0.2), // Subtle hover effect
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Rounded corners
    ),
    tileColor: Colors.transparent,
  );
}
