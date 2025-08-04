// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:golden_hour_app/screen/nurse/end_trip_screen.dart';

// class OrangeGradientAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   final String title;
//   final List<Widget>? actions;
//   final bool showBackButton;
//   final bool centerTitle;
//   final int notificationCount;
//   final VoidCallback? onBackPressed;
//    final bool showDrawerButton;
//    final VoidCallback? onDrawerPressed;

//   const OrangeGradientAppBar({
//     super.key,
//     required this.title,
//     this.actions,
//     this.showBackButton = false,
//     this.centerTitle = true,
//     this.notificationCount = 0,
//     this.onBackPressed,
//      this.showDrawerButton = false,
//      this.onDrawerPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final canPop = ModalRoute.of(context)?.canPop ?? false;
//     final shouldShowBackButton = showBackButton && canPop;

//     return AppBar(
//       title: Text(
//         title,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 19,
//           color: Colors.white,
//           shadows: [
//             Shadow(
//               blurRadius: 4.0,
//               color: Colors.black26,
//               offset: Offset(2.0, 2.0),
//             ),
//           ],
//         ),
//       ),
//       leading: showDrawerButton
//           ? IconButton(
//               icon: const Icon(Icons.menu),
//               onPressed: onDrawerPressed ?? () => Scaffold.of(context).openDrawer(),
//             )
//           : null,
//       centerTitle: centerTitle,
//       backgroundColor: Colors.transparent,
//       elevation: 10,
//       iconTheme: const IconThemeData(color: Colors.white, size: 28),
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.orange[900]!,
//               Colors.orange[700]!,
//               Colors.orange[800]!,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             stops: const [0.0, 0.5, 1.0],
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.orange.withOpacity(0.4),
//               blurRadius: 20,
//               spreadRadius: 10,
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         if (notificationCount > 0)
//           IconButton(
//             icon: Badge(
//               label: Text(notificationCount.toString()),
//               child: const Icon(Icons.notifications_outlined),
//             ),
//             onPressed: () {
//               Get.to(EndTripScreen());
//             },
//           ),
//         ...?actions,
//         const SizedBox(width: 8),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:golden_hour_app/modules/admin/end_trip_screen.dart';

class OrangeGradientAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool centerTitle;
  final int notificationCount;
  final VoidCallback? onBackPressed;
  final bool showDrawerButton;

  const OrangeGradientAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = false,
    this.centerTitle = true,
    this.notificationCount = 0,
    this.onBackPressed,
    this.showDrawerButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    final shouldShowBackButton = showBackButton && canPop;

    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),

      title: Text(
        title,
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
      leading: showDrawerButton
          ? Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            )
          : shouldShowBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
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
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.orange.withOpacity(0.4),
          //     blurRadius: 20,
          //     spreadRadius: 10,
          //   ),
          // ],
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
