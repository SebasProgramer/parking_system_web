import 'package:flutter/material.dart';
import 'package:parking_web/Views/Components/nav_item.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 204, 50, 50),
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              'Parking System',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 30.0),
            NavItem(icon: '🏠', title: 'Dashboard'),
          ],
        ),
      ),
    );
  }
}
