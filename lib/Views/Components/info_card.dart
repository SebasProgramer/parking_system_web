import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final Widget content;
  final Color backgroundColor;
  final Color textColor;

  const InfoCard({
    Key? key,
    required this.title,
    required this.content,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
          SizedBox(height: 10),
          content,
        ],
      ),
    );
  }
}
