import 'package:flutter/material.dart';
import 'package:jellyfish/pages/forecast_page.dart';

class JellyfishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jellyfish',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ForecastPage());
  }
}
