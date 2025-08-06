import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:golden_hour_app/modules/attender/attender_profile.dart';
import 'package:golden_hour_app/modules/otp_login/mobile_number_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              'John Doe', // Replace with actual user name
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            accountEmail: Text(
              'john.doe@example.com', // Replace with actual user email
              style: GoogleFonts.poppins(
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
              Get.to(() => EMTProfileScreen()); // Navigate to login screen
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
            title: 'History',
            onTap: () {
              Navigator.pop(context); // Close drawer
              // Navigate to history screen if needed
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
    );
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
        style: GoogleFonts.poppins(
          color: textColor ?? Colors.grey.shade900,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      hoverColor: Colors.orange.shade100.withOpacity(
        0.2,
      ), // Subtle hover effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      tileColor: Colors.transparent,
    );
  }
}
