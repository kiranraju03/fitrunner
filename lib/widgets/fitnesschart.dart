import 'package:flutter/material.dart';

class FitnessChart extends StatefulWidget {
  @override
  _FitnessChartState createState() => _FitnessChartState();
}

class _FitnessChartState extends State<FitnessChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "CHART",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
