import 'package:flutter/material.dart';
import 'package:wikipediaapp/locator.dart';
import 'package:wikipediaapp/ui/views/home_view.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView()
    );
  }
}
