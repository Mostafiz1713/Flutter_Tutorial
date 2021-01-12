import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  String _appBar = 'Udemy Tutorials';
  String _body = 'Hello World';
  String _textField = '';

  List<BottomNavigationBarItem> _items;
  String bottomBarValue;
  int index = 0;

  @override
  void initState() {
    _items = List();

    _items.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        title: Text('Message'),
      ),
    );
    _items.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
    );
    _items.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile'),
      ),
    );
  }

  void onRaisedButtonPressed(String value) {
    setState(() {
      _body = value;
    });
  }

  void onFlatButtonPressed() {
    setState(() {
      _body = DateTime.now().toString();
    });
  }

  void onChanged(String value) {
    setState(() {
      _textField = 'Change: $value';
    });
  }

  void onSubmit(String value) {
    setState(() {
      _textField = 'Submit: $value';
    });
  }

  bool _checkValue1 = false;

  bool _switchValue1 = false;
  bool _switchValue2 = false;

  void _checkValue1Changed(bool value) {
    setState(() {
      _checkValue1 = value;
    });
  }

  void _switchValue1Changed(bool value) {
    setState(() {
      _switchValue1 = value;
    });
  }

  void _switchValue2Changed(bool value) {
    setState(() {
      _switchValue2 = value;
    });
  }

  double _sliderValue = 0.0;

  void _setSliderValue(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  String _dateValue = '';

  Future _setDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2099));
    if (picked != null)
      setState(() {
        _dateValue = picked.toString();
      });
  }

  void _footerButtonChanged(String value) {
    setState(() {
      _body = value;
    });
  }

  Future showAlart (BuildContext context, String message) async{
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Ok'))
          ],
        )

    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(_appBar),
        actions: [IconButton(icon: Icon(Icons.notifications), onPressed: () => showAlart(context, 'Notifications'))],
      ),
      persistentFooterButtons: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () => _footerButtonChanged('Person'),
        ),
        IconButton(
          icon: Icon(Icons.add_alarm),
          onPressed: () => _footerButtonChanged('Alarm'),
        ),
        IconButton(
          icon: Icon(Icons.assignment),
          onPressed: () => _footerButtonChanged('Assignment'),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: onFlatButtonPressed,
        child: Icon(Icons.timer),
      ),
      drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: ListView(
            children: [
              Text(_body),
              RaisedButton(
                onPressed: () => onRaisedButtonPressed('Changed on Click Me'),
                child: Text('I am Raised Button Click Me'),
              ),
              FlatButton(
                onPressed: onFlatButtonPressed,
                child: Text('I am Flat Button Click Me'),
              ),
              Text(_textField),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Input Field',
                  hintText: 'Write Here',
                  icon: Icon(Icons.perm_identity),
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: onChanged,
                onSubmitted: onSubmit,
              ),
              CheckboxListTile(
                value: _checkValue1,
                onChanged: _checkValue1Changed,
                title: Text('Check Box'),
                controlAffinity: ListTileControlAffinity.leading,
                secondary: Icon(Icons.play_arrow),
                activeColor: Colors.amber,
              ),
              Switch(value: _switchValue1, onChanged: _switchValue1Changed),
              SwitchListTile(
                value: _switchValue2,
                onChanged: _switchValue2Changed,
                title: Text('Switch'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Text('Value: ${_sliderValue.round()}'),
              Slider(
                value: _sliderValue,
                onChanged: _setSliderValue,
                max: 100,
                min: 0,
              ),
              Text(_dateValue),
              RaisedButton(
                onPressed: _setDate,
                child: Text('Click Me to see date'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        fixedColor: Colors.amber,
        currentIndex: index,
        onTap: (int item) {
          setState(() {
            index = item;
            _body = "Current BottomBar Position: ${index.toString()}";
          });
        },
      ),
    );
  }
}
