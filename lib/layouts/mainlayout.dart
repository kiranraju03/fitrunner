import 'package:flutter/material.dart';

import '../widgets/profilecarddetails.dart';
import '../widgets/fitnesschart.dart';
import '../widgets/goalsset.dart';

class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Stateless: Static elements
          ProfileCardDetails(),
          //Stateful: As chart changes on selection
          FitnessChart(),
          //Stateless: Static elements
          GoalsSet()
        ],
      ),
    );
  }
}
