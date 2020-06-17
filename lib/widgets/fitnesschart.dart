import 'package:flutter/material.dart';

// import './chartlinebar.dart';

class FitnessChart extends StatefulWidget {
  @override
  _FitnessChartState createState() => _FitnessChartState();
}

class _FitnessChartState extends State<FitnessChart> {
  List<String> _dropDownChoices = ['week', 'month', 'year'];
  String _selectedOption = 'week';
  List<Map<String, Object>> chartValues = [
    {'day': 'Sun', 'barValue': 5000},
    {'day': 'Mon', 'barValue': 8000},
    {'day': 'Tue', 'barValue': 1000},
    {'day': 'Wed', 'barValue': 4000},
    {'day': 'Thu', 'barValue': 7200},
    {'day': 'Fri', 'barValue': 3000},
    {'day': 'Sat', 'barValue': 4500},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Activity",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              new DropdownButton(
                value: _selectedOption,
                items: _dropDownChoices.map((String val) {
                  return new DropdownMenuItem(
                    child: new Text(val),
                    value: val,
                  );
                }).toList(),
                onChanged: (newVal) {
                  this.setState(() {
                    _selectedOption = newVal;
                  });
                },
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Steps"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Calories"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Distance"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: chartValues
                    .map((eachBar) =>
                        chartLineBars(eachBar['day'], eachBar['barValue']))
                    .toList()),
          ),
        ],
      ),
    ));
  }

  Widget chartLineBars(String weekday, int barValue) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: [
          Container(
            width: 10,
            height: 100,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 220, 220, 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: (barValue / 100),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red[600], width: 1.0),
                    color: Colors.red[600],
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
                // FractionallySizedBox(
                //   heightFactor: (barValue / 10000),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Theme.of(context).primaryColor,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          Text(weekday),
        ],
      ),
    );
  }
}
