import 'package:flutter/material.dart';

import './profilecarddetails.dart';
import './fitnesschart.dart';
import './goalsset.dart';

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
