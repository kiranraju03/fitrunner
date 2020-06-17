import 'package:flutter/material.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

class GoalsSet extends StatefulWidget {
  @override
  _GoalsSetState createState() => _GoalsSetState();
}

class _GoalsSetState extends State<GoalsSet> {
  List<String> _dropDownChoices = ['Week', 'Month', 'Year'];
  String _selectedOption = 'Week';

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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "My Goals",
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
              steppedProgressBar("Running", 2, 30, 180, Colors.purple),
              steppedProgressBar("Pilates", 5, 60, 120, Colors.red[700]),
              steppedProgressBar("Yoga", 8, 90, 120, Colors.blue[900]),
            ]),
      ),
    );
  }

  Widget steppedProgressBar(String progressName, int progressValue,
      int progressValueDisplayed, int endProgessGoal, Color clr) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                progressName,
                style: TextStyle(fontSize: 12, color: clr),
              ),
              Row(
                children: [
                  Text(
                    progressValueDisplayed.toString(),
                    style: TextStyle(
                      color: clr,
                    ),
                  ),
                  Text(
                    " / $endProgessGoal min",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: StepProgressIndicator(
            padding: 1,
            roundedEdges: Radius.circular(20),
            size: 8,
            selectedColor: clr,
            unselectedColor: Color.fromRGBO(220, 220, 220, 2),
            totalSteps: 10,
            currentStep: progressValue,
          ),
        ),
      ],
    );
  }
}
