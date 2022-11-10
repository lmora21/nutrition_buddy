import 'package:cs422_gr4_nutribuddy/Bar_Chart_Widget/bar_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RouteBudget extends StatelessWidget {
  const RouteBudget({super.key, required this.header});

  final Widget header;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weekly Budget")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // header,
            Card(
              color: Colors.blue.shade900,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 16),
                child: SizedBox(height: 500, child: BarChartWidget()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
