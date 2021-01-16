import 'package:Flutter_Tutorial/routeGenerator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorials',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    // Initially display FirstPage
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
