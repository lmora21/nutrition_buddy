import 'package:cs422_gr4_nutribuddy/charts_flutter_remake/BarChartData.dart';
import 'package:cs422_gr4_nutribuddy/charts_flutter_remake/bar_chart_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class RouteBudget extends StatelessWidget {
  const RouteBudget({super.key, required this.header});

  final Widget header;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "Spent",
        data: BarChartData.data,
        domainFn: (BarChartModel series, _) => series.day,
        measureFn: (BarChartModel series, _) => series.spent,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Weekly Budget")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 20),
          color: Colors.indigo.shade800,
          height: double.infinity,
          child:
              // header,
              SizedBox(
            height: 560,
            child: charts.BarChart(
              series,
              animate: true,
              primaryMeasureAxis: coloredYAxis,
              domainAxis: coloredXAxis,
            ),
          ),
        ),
      ),
    );
  }
}

charts.NumericAxisSpec get coloredYAxis => const charts.NumericAxisSpec(
      renderSpec: charts.GridlineRendererSpec(
        labelStyle: charts.TextStyleSpec(
          fontSize: 10,
          color: charts.MaterialPalette.white,
        ),
      ),
    );

charts.OrdinalAxisSpec get coloredXAxis => const charts.OrdinalAxisSpec(
      renderSpec: charts.GridlineRendererSpec(
        labelStyle: charts.TextStyleSpec(
          fontSize: 15,
          color: charts.MaterialPalette.white,
        ),
      ),
    );
