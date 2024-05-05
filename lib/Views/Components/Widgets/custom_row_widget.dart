import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  final Widget dynamicWidget;
  final Widget statisticWidget;
  final double spacing;
  final bool expand;

  const CustomRowWidget({
    super.key,
    required this.dynamicWidget,
    required this.statisticWidget,
    this.spacing = 8.0,
    this.expand = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (expand) Expanded(child: dynamicWidget),
        SizedBox(width: spacing),
        if (expand) Expanded(child: statisticWidget),
      ],
    );
  }
}
