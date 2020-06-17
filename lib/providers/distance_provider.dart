import 'package:flutter/material.dart';

class DistanceProvider extends ChangeNotifier {
  List<Map<String, Object>> _distanceList = [
    {'day': 'Sun', 'distance': 50},
    {'day': 'Mon', 'distance': 80},
    {'day': 'Tue', 'distance': 10},
    {'day': 'Wed', 'distance': 40},
    {'day': 'Thu', 'distance': 72},
    {'day': 'Fri', 'distance': 30},
    {'day': 'Sat', 'distance': 45},
  ];

  int totalDistance = 0;

  List<Map<String, Object>> get distanceList {
    return [..._distanceList];
  }

  void setTotalDistance() {
    _distanceList.forEach((element) {
      totalDistance += element['distance'];
    });
    print(totalDistance);
  }
}
