import 'package:covid_app/countries.dart';
import 'package:flutter/material.dart';

void main() => runApp(new CovidTrackerApp());

class CovidTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Covid Tracker",
      home: Scaffold(
        body: Countries(),
      ),
    );
  }
}
