import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
            Wrap(
              runSpacing: 20,
              children: <Widget>[
                pie,
                coolBar("Protein", 0.5, context),
                coolBar("Fiber", 0.3, context),
                coolBar("Vitamin A", 0.66, context),
                coolBar("Vitamin B3", 0.7, context),
                coolBar("Vitamin B5", 0.1, context),
                coolBar("Vitamin B6", 0.2, context),
                coolBar("Vitamin B7", 1, context),
                coolBar("Vitamin B9", 0.8, context),
                coolBar("Vitamin B12", 0.85, context),
                coolBar("Vitamin C", 0.9, context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget coolBar(String text, double percent, dynamic context) {
  return LinearPercentIndicator(
    alignment: MainAxisAlignment.center,
    width: MediaQuery.of(context).size.width - 50,
    animation: true,
    lineHeight: 20.0,
    animationDuration: 800,
    percent: percent,
    center: Text("$text - ${percent * 100}%"),
    barRadius: const Radius.circular(20),
    progressColor: Colors.green,
  );
}
