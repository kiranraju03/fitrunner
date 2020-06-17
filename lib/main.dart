import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/mainlayout.dart';
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
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MainLayout()),
    );
  }
}
