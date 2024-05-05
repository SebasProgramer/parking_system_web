import 'package:flutter/material.dart';

class StatisticWidget extends StatelessWidget {
  final String title;
  final Future<int> Function() fetchDataFunction;

  const StatisticWidget({
    super.key,
    required this.title,
    required this.fetchDataFunction,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: fetchDataFunction(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListTile(
            title: Text(title),
            trailing: Text(snapshot.data.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
          );
        }
      },
    );
  }
}
