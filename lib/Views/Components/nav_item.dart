import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String icon;
  final String title;

  const NavItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 20.0, color: Colors.white), // Asegurando que el icono sea blanco
          ),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: const TextStyle(fontSize: 16.0, color: Colors.white), // También asegurando que el título sea blanco
          ),
        ],
      ),
    );
  }
}
