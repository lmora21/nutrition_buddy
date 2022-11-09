import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class RouteCal extends StatelessWidget {
  const RouteCal({super.key, required this.pie});

  final Widget pie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Welcome to Calories & Nutrition Route!")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            pie,
            GestureDetector(
              child: Image.asset("images/budget.png"),
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
