import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const String appBar = 'Flutter Tutorials';
class _HomePageState extends State<HomePage> {
  var _height = 50;
  var _width = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Tutorial'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              height: 50,
              width: 200,
              child: RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/beginner'),
                child: Text('Beginner'),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              height: 50,
              width: 200,
              child: RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/intermediate'),
                child: Text('Intermediate'),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              height: 50,
              width: 200,
              child: RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/beginner'),
                child: Text('Advanced'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
