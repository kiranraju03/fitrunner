import 'package:flutter/material.dart';

class CaloriesProvider extends ChangeNotifier {
  List<Map<String, Object>> _caloriesList = [
    {'day': 'Sun', 'caloriesBurnt': 500},
    {'day': 'Mon', 'caloriesBurnt': 800},
    {'day': 'Tue', 'caloriesBurnt': 100},
    {'day': 'Wed', 'caloriesBurnt': 400},
    {'day': 'Thu', 'caloriesBurnt': 720},
    {'day': 'Fri', 'caloriesBurnt': 300},
    {'day': 'Sat', 'caloriesBurnt': 450},
  ];

  var totalCalories = 0;

  List<Map<String, Object>> get caloriesList {
    return [..._caloriesList];
  }

  void setTotalCalories() {
    _caloriesList.forEach((element) {
      totalCalories += element['caloriesBurnt'];
    });

    print(totalCalories);
  }
}
