import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// import './chartlinebar.dart';
import '../providers/calories_provider.dart';
import '../providers/distance_provider.dart';
import '../providers/totalsteps_provider.dart';

class FitnessChart extends StatefulWidget {
  @override
  _FitnessChartState createState() => _FitnessChartState();
}

class _FitnessChartState extends State<FitnessChart> {
  List<String> _dropDownChoices = ['Week', 'Month', 'Year'];
  String _selectedOption = 'Week';

  String selectedChartOption = "steps";

  List<Map<String, Object>> chartValues = [];

  List<Widget> chartDisplayed = [];

  CaloriesProvider caloriesProvider;
  DistanceProvider distanceProvider;
  TotalStepsProvider totalStepsProvider;

  @override
  void initState() {
    super.initState();
    caloriesProvider = Provider.of<CaloriesProvider>(context, listen: false);
    distanceProvider = Provider.of<DistanceProvider>(context, listen: false);
    totalStepsProvider =
        Provider.of<TotalStepsProvider>(context, listen: false);

    //Making steps chart to be visible on launch
    this.setState(() {
      chartValues = totalStepsProvider.stepsList;
    });
    print(chartValues);
    List<Widget> li = stepsChartTrigger();
    this.setState(() {
      chartDisplayed = li;
    });
  }

  List<Widget> calorieChartTrigger() {
    return chartValues
        .map((eachBar) =>
            chartLined(eachBar['day'], eachBar['caloriesBurnt'], 100))
        .toList();
  }

  List<Widget> distanceChartTrigger() {
    return chartValues
        .map((eachBar) => chartLined(eachBar['day'], eachBar['distance'], 10))
        .toList();
  }

  List<Widget> stepsChartTrigger() {
    return chartValues
        .map((eachBar) => chartLined(eachBar['day'], eachBar['steps'], 1000))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // print(caloriesProvider.caloriesList);
    // print(distanceProvider.distanceList);
    // print(totalStepsProvider.stepsList);
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
                padding: const EdgeInsets.all(5.0),
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
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: GestureDetector(
                    onTap: () {
                      this.setState(() {
                        chartValues = totalStepsProvider.stepsList;
                        selectedChartOption = "steps";
                      });
                      print(chartValues);
                      List<Widget> li = stepsChartTrigger();
                      this.setState(() {
                        chartDisplayed = li;
                      });
                    },
                    child: Text(
                      "Steps",
                      style: TextStyle(
                        color: selectedChartOption == "steps"
                            ? Colors.purple
                            : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: GestureDetector(
                  child: Text(
                    "Calories",
                    style: TextStyle(
                      color: selectedChartOption == "calories"
                          ? Colors.purple
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    this.setState(() {
                      chartValues = caloriesProvider.caloriesList;
                      selectedChartOption = "calories";
                    });
                    print(chartValues);
                    List<Widget> li = calorieChartTrigger();
                    this.setState(() {
                      chartDisplayed = li;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: GestureDetector(
                    onTap: () {
                      this.setState(() {
                        chartValues = distanceProvider.distanceList;
                        selectedChartOption = "distance";
                      });
                      print(chartValues);
                      List<Widget> li = distanceChartTrigger();
                      this.setState(() {
                        chartDisplayed = li;
                      });
                      print(chartDisplayed);
                    },
                    child: Text(
                      "Distance",
                      style: TextStyle(
                        color: selectedChartOption == "distance"
                            ? Colors.purple
                            : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
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

  Widget chartLined(String weekday, int barValue, int divider) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              barValue.toString(),
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          StepProgressIndicator(
            direction: Axis.vertical,
            progressDirection: TextDirection.rtl,
            padding: 0,
            roundedEdges: Radius.circular(20),
            size: 10,
            selectedColor: Colors.red[700],
            unselectedColor: Color.fromRGBO(220, 220, 220, 2),
            totalSteps: 10,
            currentStep: (barValue / divider).round(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              weekday,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
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
