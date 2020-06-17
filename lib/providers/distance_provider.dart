import 'package:flutter/material.dart';

class DistanceProvider extends ChangeNotifier {
  List<Map<String, Object>> _distanceList = [
    {'day': 'Sun', 'distance': 50},
    {'day': 'Mon', 'distance': 10},
    {'day': 'Tue', 'distance': 40},
    {'day': 'Wed', 'distance': 60},
    {'day': 'Thu', 'distance': 72},
    {'day': 'Fri', 'distance': 80},
    {'day': 'Sat', 'distance': 20},
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
