import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectDate = DateTime.now();
  TimeOfDay selectTime = TimeOfDay(hour: 9, minute: 30);

  Future<void> _selectDate() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (date == null) return;
    setState(() {
      selectDate = date;
    });
  }

  Future<void> _selectTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectTime,
    );
    if (time == null) return;
    setState(() {
      selectTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    onTap: _selectDate,
                    child: Row(
                      children: <Widget>[
                        Text(DateFormat.yMMMMd().format(selectDate)),
                        Icon(Icons.arrow_drop_down),
                      ],
                    )),
                InkWell(
                    onTap: _selectTime,
                    child: Row(
                      children: <Widget>[
                        Text(selectTime.format(context)),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
