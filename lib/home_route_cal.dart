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
            progressColor: percent < 0.2
                ? Colors.red
                : percent < 0.4
                    ? Colors.orange
                    : percent < 0.6
                        ? Colors.yellow
                        : percent < 0.8
                            ? Colors.lightGreen
                            : percent < 1.0
                                ? Colors.green
                                : Colors.pink.shade100,
            center: Text(
              "$percentString%",
              style: TextStyle(
                  color: percent < 1.0 ? Colors.black : Colors.red.shade800),
            ),
            clipLinearGradient: true,
          ),
          indentedDivider(),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Calories & Nutrition")),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 5,
                children: <Widget>[
                  textTitle("Daily Calories"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 20,
                        children: [
                          pie,
                          Text(
                              "${dmap.values.first.round()} of ${(dmap.values.first + dmap.values.last).round()} Calories",
                              style: const TextStyle(fontSize: 18)),
                        ]),
                  ),
                  textTitle("Nutrients"),
                  coolBar("Protein", 40, 80),
                  coolBar("Carbohydrates", 12, 260),
                  coolBar("Fiber", 220, 230),
                  coolBar("Sugars", 33, 60),
                  coolBar("Fat", 200, 60),
                  coolBar("Saturated", 13, 25),
                  coolBar("Cholesterol", 235, 300),
                  coolBar("Sodium", 1.1, 2.3),
                  coolBar("Potassium", .7, 3.5),
                  coolBar("Vitamin A", 78, 100),
                  coolBar("Vitamin C", 32, 100),
                  coolBar("Iron", 50, 100),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Map the pie chart is based on
const Map<String, double> dmap = {
  "consumed": 1200,
  "unused": 1000,
};

Widget indentedDivider() {
  return const Divider(
      color: Colors.black12, endIndent: 30, indent: 30, thickness: 2);
}

Widget textTitle(String title) {
  return Container(
    alignment: Alignment.center,
    width: double.infinity,
    decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(60))),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Text(title,
          style: const TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)),
    ),
  );
}
