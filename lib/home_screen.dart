import 'package:cs422_gr4_nutribuddy/home_route_budget.dart';
import 'package:cs422_gr4_nutribuddy/home_route_cal.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// Screen content for when home icon is pressed on bottom tab
Column homeScreen(context) {
  // Create a consistent card for adding an item to the screen
  Widget getCustomCard(Widget icon, String title, {bool isCal = true}) {
    return GestureDetector(
      child: Container(
          // padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: SizedBox(
                      height: 180, width: double.infinity, child: icon),
                ),
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            if (isCal) {
              return RouteCal(pie: icon);
            } else {
              return RouteBudget(header: icon);
            }
          },
        ),
      ),
    );
  }

  double spacing = 25;
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(0, spacing, 0, spacing),
          child: Wrap(
            runSpacing: spacing,
            children: <Widget>[
              getCustomCard(graphStack, "Calories\n&\nNutrients"),
              getCustomCard(Image.asset("images/budget.png"), "Weekly\nBudget",
                  isCal: false),
            ],
          )),
    ],
  );
}

// Create stack of Pie Chart and % covered
Widget get graphStack => Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          dataMap: dmap,
          chartType: ChartType.ring,
          legendOptions: const LegendOptions(showLegends: false),
          chartValuesOptions: const ChartValuesOptions(showChartValues: false),
          chartRadius: 150,
          colorList: [Colors.red, Colors.red.withOpacity(0.5)],
          degreeOptions: const DegreeOptions(initialAngle: -90),
        ),
        Center(
          child: Text(
            "${(dmap.values.first / (dmap.values.last + dmap.values.first) * 100).truncate()}%",
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
