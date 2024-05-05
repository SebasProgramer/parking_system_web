import 'package:flutter/material.dart';
import 'package:parking_web/Views/Components/nav_item.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      color: const Color.fromARGB(255, 156, 44, 44),
      padding: const EdgeInsets.all(10.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Text(
            'Parking System',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.0),
          NavItem(icon: '🏠', title: 'Dashboard'),
        ],
      ),
    );
  }
}
