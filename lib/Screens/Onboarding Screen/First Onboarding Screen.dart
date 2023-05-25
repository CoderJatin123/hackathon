import 'package:flutter/material.dart';

class OnboardingModel extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final Color gradientColor;
  final IconData icon;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.color,
    required this.gradientColor,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, gradientColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
              ),
              child:  Icon(
                icon,
                size: 100,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.5
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                height: 1.8
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
