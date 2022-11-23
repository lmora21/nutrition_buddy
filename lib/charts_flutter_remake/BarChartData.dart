import 'package:cs422_gr4_nutribuddy/charts_flutter_remake/bar_chart_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChartData {
  static final List<BarChartModel> data = [
    BarChartModel(
      day: "10/23\n-\n10/29",
      spent: 66.97,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      day: "10/30\n-\n11/5",
      spent: 11.20,
      color: charts.ColorUtil.fromDartColor(Colors.orange),
    ),
    BarChartModel(
      day: "11/6\n-\n11/12",
      spent: 19.98,
      color: charts.ColorUtil.fromDartColor(Colors.amber),
    ),
    BarChartModel(
      day: "11/13\n-\n11/19",
      spent: 2.97,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModel(
      day: "11/20\n-\n11/26",
      spent: 4.99,
      color: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    BarChartModel(
      day: "11/27\n-\n12/3",
      spent: 44.97,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
  ];
}
