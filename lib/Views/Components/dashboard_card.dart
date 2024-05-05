import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Widget content;

  const DashboardCard({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10.0),
          content,
        ],
      ),
    );
  }
}