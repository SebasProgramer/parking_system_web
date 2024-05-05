import 'package:flutter/material.dart';
import 'package:parking_web/Views/Components/dashboard_card.dart';

class DynamicListWidget extends StatelessWidget {
  final String title;
  final List<dynamic> items;
  final String Function(dynamic) displayFunction;

  const DynamicListWidget({
    Key? key,
    required this.title,
    required this.items,
    required this.displayFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0, // Asegura que todos los DynamicListWidgets tengan el mismo tamaño
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DashboardCard(
                title: title,
                backgroundColor: const Color(0xFF11151A),
                textColor: Colors.white,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items.map((item) => Text(displayFunction(item), style: const TextStyle(color: Colors.white))).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
