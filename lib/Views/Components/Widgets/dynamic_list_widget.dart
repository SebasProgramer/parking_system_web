import 'package:flutter/material.dart';
import 'package:parking_web/Views/Components/dashboard_card.dart';

class DynamicListWidget extends StatefulWidget {
  final String title;
  final List<dynamic> items;
  final Function displayFunction;

  const DynamicListWidget({
    super.key,
    required this.title,
    required this.items,
    required this.displayFunction,
  });

  @override
  _DynamicListWidgetState createState() => _DynamicListWidgetState();
}

class _DynamicListWidgetState extends State<DynamicListWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.6,
      color: const Color(0xFFF7F7F7),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                var displayTexts = widget.displayFunction(widget.items[index]).split('-');
                return DashboardCard(
                  title: displayTexts[0].trim(),
                  subtitle: displayTexts.length > 1 ? displayTexts[1].trim() : '',
                  icon: Icons.list,
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
