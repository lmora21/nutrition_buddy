import 'package:cs422_gr4_nutribuddy/Bar_Chart_Widget/data.dart';
import 'package:flutter/material.dart';

class BarData {
  static int interval = 5;

  static List<Data> barData = [
    Data(id: 0, name: "Sun", y: 66.97, color: Colors.red),
    Data(id: 1, name: "Mon", y: 11.20, color: Colors.orange),
    Data(id: 2, name: "Tues", y: 19.98, color: Colors.amber),
    Data(id: 3, name: "Wed", y: 2.97, color: Colors.green),
    Data(id: 4, name: "Thurs", y: 4.99, color: Colors.blue),
    Data(id: 5, name: "Fri", y: 12.49, color: Colors.indigo),
    Data(id: 6, name: "Sat", y: 44.97, color: Colors.purple),
  ];
}
