import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String day;
  double spent;
  final charts.Color color;

  BarChartModel({required this.day, required this.spent, required this.color});
}
