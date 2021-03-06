import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './layouts/mainlayout.dart';
import './layouts/mapslayout.dart';

import './providers/calories_provider.dart';
import './providers/distance_provider.dart';
import './providers/totalsteps_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CaloriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DistanceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TotalStepsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FitRunner',
        theme: ThemeData(
          fontFamily: 'Nunito',
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainLayout(), //To Access the First Screenshot
        // home: MapsLayout(), //To Access the Second Screenshot
      ),
    );
  }
}
