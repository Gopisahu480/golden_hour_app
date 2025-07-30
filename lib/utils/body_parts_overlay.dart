import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyPartSelector extends StatelessWidget {
  final dynamic controller;
  final List<Map<String, dynamic>> bodyParts;

  const BodyPartSelector({
    super.key,
    required this.controller,
    required this.bodyParts,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/body.png',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            for (var part in bodyParts) ...[
              // Body Marker
              Positioned(
                left: part['iconLeft'],
                top: part['iconTop'],
                child: Obx(
                  () => GestureDetector(
                    onTap: () => controller.toggleBodyPart(part['name']),
                    child: Icon(
                      Icons.circle,
                      color: controller.selectedBodyParts.contains(part['name'])
                          ? Colors.green
                          : Colors.red,
                      size: 11,
                    ),
                  ),
                ),
              ),

              // Label with Checkbox
              Positioned(
                left: part['alignRight'] == true ? null : part['labelX'],
                right: part['alignRight'] == true ? part['labelX'] : null,
                top: part['labelY'],
                child: Row(
                  children: part['alignRight'] == true
                      ? [
                          Text(
                            _capitalize(part['name']),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Checkbox(
                              value: controller.selectedBodyParts
                                  .contains(part['name']),
                              onChanged: (value) =>
                                  controller.toggleBodyPart(part['name']),
                              activeColor: Colors.green,
                            ),
                          ),
                        ]
                      : [
                          Obx(
                            () => Checkbox(
                              value: controller.selectedBodyParts
                                  .contains(part['name']),
                              onChanged: (value) =>
                                  controller.toggleBodyPart(part['name']),
                              activeColor: Colors.green,
                            ),
                          ),
                          Text(
                            _capitalize(part['name']),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _capitalize(String s) =>
      s[0].toUpperCase() + s.substring(1).replaceAllMapped(RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}');
}
