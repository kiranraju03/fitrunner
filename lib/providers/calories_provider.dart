import 'package:flutter/material.dart';

class CaloriesProvider extends ChangeNotifier {
  List<Map<String, Object>> _caloriesList = [
    {'day': 'Sun', 'caloriesBurnt': 500},
    {'day': 'Mon', 'caloriesBurnt': 100},
    {'day': 'Tue', 'caloriesBurnt': 400},
    {'day': 'Wed', 'caloriesBurnt': 300},
    {'day': 'Thu', 'caloriesBurnt': 600},
    {'day': 'Fri', 'caloriesBurnt': 800},
    {'day': 'Sat', 'caloriesBurnt': 350},
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
