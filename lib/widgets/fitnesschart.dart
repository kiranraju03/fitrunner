import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// import './chartlinebar.dart';
import '../providers/calories_provider.dart';

class FitnessChart extends StatefulWidget {
  @override
  _FitnessChartState createState() => _FitnessChartState();
}

class _FitnessChartState extends State<FitnessChart> {
  List<String> _dropDownChoices = ['Week', 'Month', 'Year'];
  String _selectedOption = 'Week';
  // List<Map<String, Object>> chartValues = [
  //   {'day': 'Sun', 'barValue': 5000},
  //   {'day': 'Mon', 'barValue': 8000},
  //   {'day': 'Tue', 'barValue': 1000},
  //   {'day': 'Wed', 'barValue': 4000},
  //   {'day': 'Thu', 'barValue': 7200},
  //   {'day': 'Fri', 'barValue': 3000},
  //   {'day': 'Sat', 'barValue': 4500},
  // ];
  List<Map<String, Object>> chartValues = [];

  List<Widget> chartDisplayed = [];

  CaloriesProvider caloriesProvider;

  @override
  void initState() {
    super.initState();
    caloriesProvider = Provider.of<CaloriesProvider>(context, listen: false);
    // caloriesProvider.setTotalCalories();
  }

  @override
  Widget build(BuildContext context) {
    print(caloriesProvider.caloriesList);
    // this.setState(() {
    //   chartValues = caloriesProvider.caloriesList;
    // });
    return Center(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Total Activity",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              new DropdownButton(
                underline: Container(), //to get rid of the underline
                iconEnabledColor: Colors.purple,
                value: _selectedOption,
                items: _dropDownChoices.map((String val) {
                  return new DropdownMenuItem(
                    child: new Text(
                      val,
                      style: TextStyle(color: Colors.purple),
                    ),
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
                child: GestureDetector(
                  child: Text("Calories"),
                  onTap: () {
                    this.setState(() {
                      chartValues = caloriesProvider.caloriesList;
                    });
                    List<Widget> li = calorieChartTrigger();
                    this.setState(() {
                      chartDisplayed = li;
                    });
                  },
                ),
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
              children: chartDisplayed,
              // children: chartValues
              //     .map((eachBar) =>
              //         chartLined(eachBar['day'], eachBar['activity']))
              //     .toList()
            ),
          ),
        ],
      ),
    ));
  }

  List<Widget> calorieChartTrigger() {
    return chartValues
        .map((eachBar) =>
            chartLined(eachBar['day'], eachBar['caloriesBurnt'], 100))
        .toList();
  }

  Widget chartLined(String weekday, int barValue, int divider) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: [
          StepProgressIndicator(
            direction: Axis.vertical,
            progressDirection: TextDirection.rtl,
            padding: 0,
            roundedEdges: Radius.circular(20),
            size: 8,
            selectedColor: Colors.red[700],
            unselectedColor: Color.fromRGBO(220, 220, 220, 2),
            totalSteps: 10,
            currentStep: (barValue / divider).round(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(weekday),
          ),
        ],
      ),
    );
  }

  // Widget chartLineBars(String weekday, int barValue) {
  //   return Flexible(
  //     fit: FlexFit.tight,
  //     child: Column(
  //       children: [
  //         Container(
  //           width: 10,
  //           height: 100,
  //           child: Stack(
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                   color: Color.fromRGBO(220, 220, 220, 2),
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //               ),
  //               Container(
  //                 height: (barValue / 100),
  //                 decoration: BoxDecoration(
  //                   border: Border.all(color: Colors.red[600], width: 1.0),
  //                   color: Colors.red[600],
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //               )
  //               // FractionallySizedBox(
  //               //   heightFactor: (barValue / 10000),
  //               //   child: Container(
  //               //     decoration: BoxDecoration(
  //               //       color: Theme.of(context).primaryColor,
  //               //       borderRadius: BorderRadius.circular(10),
  //               //     ),
  //               //   ),
  //               // )
  //             ],
  //           ),
  //         ),
  //         Text(weekday),
  //       ],
  //     ),
  //   );
  // }
}
