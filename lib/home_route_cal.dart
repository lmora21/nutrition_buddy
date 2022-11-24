import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RouteCal extends StatelessWidget {
  const RouteCal({super.key, required this.pie});

  final Widget pie;

  @override
  Widget build(BuildContext context) {
    // Custom Bar with header and progress bar
    Widget coolBar(String text, double progress, double goal) {
      double percent = (progress / goal);
      String percentString = (percent * 100).toStringAsFixed(2);
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Text(text, textAlign: TextAlign.center),
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Text("${progress}g of ${goal}g",
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
          LinearPercentIndicator(
            alignment: MainAxisAlignment.center,
            width: MediaQuery.of(context).size.width - 50,
            animation: true,
            lineHeight: 20.0,
            animationDuration: 800,
            percent: percent <= 1.0 ? percent : 1.0,
            barRadius: const Radius.circular(20),
            // progressColor: percent < 0.25
            //     ? Colors.red
            //     : percent < 0.5
            //         ? Colors.orange
            //         : percent < 0.75
            //             ? Colors.yellow
            //             : Colors.green,
            center: Text("$percentString%"),
            linearGradient: const LinearGradient(colors: [
              Colors.red,
              Colors.yellow,
              Colors.lightGreen,
              Colors.green
            ]),
            clipLinearGradient: true,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Calories & Nutrition")),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  runSpacing: 20,
                  children: <Widget>[
                    pie,
                    coolBar("Protein", 40, 80),
                    coolBar("Carbohydrates", 12, 260),
                    coolBar("Fiber", 220, 230),
                    coolBar("Sugars", 33, 60),
                    coolBar("Fat", 200, 60),
                    coolBar("Saturated", 10, 25),
                    coolBar("Cholesterol", 200, 300),
                    coolBar("Sodium", 1.1, 2.3),
                    coolBar("Potassium", 1.1, 3.5),
                    coolBar("Vitamin A", 80, 100),
                    coolBar("Vitamin C", 32, 100),
                    coolBar("Iron", 50, 100),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
