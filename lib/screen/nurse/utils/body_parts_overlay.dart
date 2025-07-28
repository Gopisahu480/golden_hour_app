import 'package:flutter/material.dart';

class BodyPartsOverlay extends StatelessWidget {
  const BodyPartsOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      child: Stack(
        children: [
          Center(
            child: Image.asset('assets/body.png', height: 200),
          ),

          // Head
          const BodyPartLabel(
            left: 159.5,
            top: 26.5,
            dotSize: 9,
            labelOffsetX: 15,
            labelOffsetY: -8,
            label: '-----> Head',
          ),

          // Chest
          const BodyPartLabel(
            left: 166,
            top: 53,
            dotSize: 10,
            labelOffsetX: 24,
            labelOffsetY: -6,
            label: '-----> Chest',
          ),

          // Left Hand
          const BodyPartLabel(
            left: 185,
            top: 80,
            dotSize: 6,
            labelOffsetX: 11,
            labelOffsetY: -8,
            label: '-> Left Hand',
          ),

          // Right Hand
          const BodyPartLabel(
            left: 137.5,
            top: 79.5,
            dotSize: 6,
            labelOffsetX: -100,
            labelOffsetY: -8,
            label: 'Right Hand <-',
          ),

          // Left Leg
          const BodyPartLabel(
            left: 168,
            top: 145.5,
            dotSize: 6,
            labelOffsetX: 11,
            labelOffsetY: -8,
            label: '---> Left Leg',
          ),

          // Right Leg
          const BodyPartLabel(
            left: 154,
            top: 145.5,
            dotSize: 6,
            labelOffsetX: -100,
            labelOffsetY: -8,
            label: 'Right Leg <---',
          ),
        ],
      ),
    );
  }
}

class BodyPartLabel extends StatelessWidget {
  final double left;
  final double top;
  final double? dotSize;
  final Color dotColor;
  final String label;
  final double labelOffsetX;
  final double labelOffsetY;
  final VoidCallback? onTap;

  const BodyPartLabel({
    super.key,
    required this.left,
    required this.top,
    required this.label,
    this.dotSize = 8,
    this.dotColor = Colors.red,
    this.labelOffsetX = 10,
    this.labelOffsetY = -10,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: left,
          top: top,
          child: Icon(Icons.circle, color: dotColor, size: dotSize),
        ),
        Positioned(
          left: left + labelOffsetX,
          top: top + labelOffsetY,
          child: GestureDetector(
            onTap: onTap ?? () => debugPrint('$label tapped'),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
