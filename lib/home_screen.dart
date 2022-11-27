import 'package:cs422_gr4_nutribuddy/home_route_budget.dart';
import 'package:cs422_gr4_nutribuddy/home_route_cal.dart';
import 'package:cs422_gr4_nutribuddy/home_route_settings.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// Screen content for when home icon is pressed on bottom tab
Column homeScreen(context) {
  // Create a consistent card for adding an item to the screen
  Widget getCustomCard(Widget icon, String title, {required index}) {
    return GestureDetector(
      child: Container(
          // padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.cyan],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(height: 160, child: icon),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
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
            switch (index) {
              case 0:
                return RouteCal(pie: icon);
              case 1:
                return const RouteBudget();
              case 2:
                return const RouteAppSettings();
              default:
                return const FlutterLogo();
            }
          },
        ),
      ),
    );
  }

  double spacing = 20;
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(0, spacing, 0, spacing),
          child: Wrap(
            runSpacing: spacing,
            children: <Widget>[
              getCustomCard(graphStack, "Calories\n&\nNutrients", index: 0),
              getCustomCard(Image.asset("images/budget.png"), "Weekly\nBudget",
                  index: 1),
              getCustomCard(
                  Icon(
                    Icons.settings,
                    size: 140,
                    color: Colors.blue.shade800,
                  ),
                  "Settings\n&\nPreferences",
                  index: 2),
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
