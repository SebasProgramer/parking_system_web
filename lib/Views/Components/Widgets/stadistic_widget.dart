import 'package:flutter/material.dart';

class StatisticWidget extends StatelessWidget {
  final String title;
  final Future<int> Function() fetchDataFunction;

  const StatisticWidget({
    Key? key,
    required this.title,
    required this.fetchDataFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: fetchDataFunction(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListTile(
            title: Text(title),
            trailing: Text(snapshot.data.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
          );
        }
      },
    );
  }
}
