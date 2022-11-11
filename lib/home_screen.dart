import 'package:cs422_gr4_nutribuddy/home_route_budget.dart';
import 'package:cs422_gr4_nutribuddy/home_route_cal.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// Screen content for when home icon is pressed on bottom tab
Column homeScreen(context) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Wrap(
        runSpacing: 10,
        children: <Widget>[
          getCustomCard(graphStack, "Calories\n&\nNutrients", context),
          getCustomCard(
              Image.asset("images/budget.png"), "Weekly\nBudget", context,
              isCal: false),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 300,
              child: FloatingActionButton(
                onPressed: () => {},
                tooltip: 'Add Widget Shortcut',
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

// Create a consistent card for adding an item to the screen
Widget getCustomCard(Widget icon, String title, dynamic ctx,
    {bool isCal = true}) {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 150, child: icon),
          const SizedBox(width: 50),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
    onTap: () => Navigator.push(
      ctx,
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

// Map the pie chart is based on
const Map<String, double> dmap = {
  "consumed": 8,
  "unused": 2,
};
