import 'package:flutter/material.dart';

class TotalStepsProvider extends ChangeNotifier {
  List<Map<String, Object>> _stepsList = [
    {'day': 'Sun', 'steps': 5000},
    {'day': 'Mon', 'steps': 8000},
    {'day': 'Tue', 'steps': 1000},
    {'day': 'Wed', 'steps': 4000},
    {'day': 'Thu', 'steps': 7200},
    {'day': 'Fri', 'steps': 3000},
    {'day': 'Sat', 'steps': 4500},
  ];

  int totalSteps = 0;

  List<Map<String, Object>> get stepsList {
    return [..._stepsList];
  }

  void setTotalSteps() {
    _stepsList.forEach((element) {
      totalSteps += element['steps'];
    });
    print(totalSteps);
  }

}
