import 'package:flutter/material.dart';
import 'package:jellyfish/app/features/forecast/forecast.dart';

class JellyfishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jellyfish',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Forecast());
  }
}
