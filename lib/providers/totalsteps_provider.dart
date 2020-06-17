import 'package:flutter/material.dart';

class TotalStepsProvider extends ChangeNotifier {
  List<Map<String, Object>> _stepsList = [
    {'day': 'Sun', 'steps': 1500},
    {'day': 'Mon', 'steps': 4500},
    {'day': 'Tue', 'steps': 500},
    {'day': 'Wed', 'steps': 5000},
    {'day': 'Thu', 'steps': 3000},
    {'day': 'Fri', 'steps': 2000},
    {'day': 'Sat', 'steps': 8000},
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
