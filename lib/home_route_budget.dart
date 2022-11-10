import 'package:flutter/material.dart';

class RouteBudget extends StatelessWidget {
  const RouteBudget({super.key, required this.pie});

  final Widget pie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weekly Budget")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            pie,
          ],
        ),
      ),
    );
  }
}
