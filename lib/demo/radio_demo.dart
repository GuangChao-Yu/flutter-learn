import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;

  void _handlerRadioChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RaditDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('RadioValue $_radioGroupA'),
            SizedBox(
              height: 32.0,
            ),
            RadioListTile(
              value: 0,
              groupValue: _radioGroupA,
              onChanged: _handlerRadioChanged,
              title: Text('option a'),
              subtitle: Text('descripton'),
              secondary: Icon(Icons.filter_1),
              selected: _radioGroupA == 0,
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioGroupA,
              onChanged: _handlerRadioChanged,
              title: Text('option b'),
              subtitle: Text('descripton'),
              secondary: Icon(Icons.filter_1),
              selected: _radioGroupA == 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Radio(
                //   value: 0,
                //   groupValue: _radioGroupA,
                //   onChanged: _handlerRadioChanged,
                //   activeColor: Colors.black,
                // ),
                // Radio(
                //   value: 1,
                //   groupValue: _radioGroupA,
                //   onChanged: _handlerRadioChanged,
                //   activeColor: Colors.black,
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
