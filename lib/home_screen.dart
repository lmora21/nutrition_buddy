import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// Screen content for when home icon is pressed on bottom tab
Column get homeScreen => Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Wrap(
          runSpacing: 10,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      PieChart(
                        dataMap: dmap,
                        chartType: ChartType.ring,
                        legendOptions: const LegendOptions(showLegends: false),
                        chartValuesOptions:
                            const ChartValuesOptions(showChartValues: false),
                        chartRadius: 120,
                        colorList: [Colors.red, Colors.red.withOpacity(0.5)],
                        degreeOptions: const DegreeOptions(initialAngle: -90),
                      ),
                      Center(
                        child: Text(
                          "${(dmap.values.first / (dmap.values.last + dmap.values.first) * 100).truncate()}%",
                          style: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const Text(
                    "Calories\n&\nNutrients",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            // TODO: Make these containers be the same size
            Container(
              padding: const EdgeInsets.all(10),
              height: 130,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/budget.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  const Text(
                    "Weekly\nBudget",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );

const Map<String, double> dmap = {
  "consumed": 8,
  "total": 2,
};
