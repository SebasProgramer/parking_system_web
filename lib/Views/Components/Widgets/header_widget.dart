import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const HeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24.0),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14.0),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
