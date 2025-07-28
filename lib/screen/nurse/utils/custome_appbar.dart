import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:golden_hour_app/screen/nurse/end_trip_screen.dart';

class OrangeGradientAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool centerTitle;
  final int notificationCount;
  final VoidCallback? onBackPressed;

  const OrangeGradientAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = false,
    this.centerTitle = true,
    this.notificationCount = 0,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    final shouldShowBackButton = showBackButton && canPop;

    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
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
      leading: shouldShowBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      centerTitle: centerTitle,
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
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 10,
            ),
          ],
        ),
      ),
      actions: [
        if (notificationCount > 0)
          IconButton(
            icon: Badge(
              label: Text(notificationCount.toString()),
              child: const Icon(Icons.notifications_outlined),
            ),
            onPressed: () {
              Get.to(EndTripScreen());
            },
          ),
        ...?actions,
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
