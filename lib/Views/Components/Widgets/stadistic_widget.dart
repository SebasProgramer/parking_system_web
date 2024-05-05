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
    return Card(
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: FutureBuilder<int>(
        future: fetchDataFunction(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ),
            );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)),
            );
          } else {
            return ListTile(
              title: Text(title, style: TextStyle(fontSize: 18)),
              trailing: Text(
                snapshot.data.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).primaryColor),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            );
          }
        },
      ),
    );
  }
}
