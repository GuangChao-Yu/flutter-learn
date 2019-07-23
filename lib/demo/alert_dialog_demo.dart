import 'package:flutter/material.dart';
import 'dart:async';

enum Action { Ok, Cancel }

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _chiose = 'Nothing';

  Future _openAlertDialog() async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false, //设置点击空白区域不可关闭
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('alert diaolg'),
            content: Text('are you sure about this?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, Action.Cancel);
                },
              ),
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.pop(context, Action.Ok);
                },
              )
            ],
          );
        });
    switch (action) {
      case Action.Ok:
        setState(() {
          _chiose = 'Ok';
        });
        break;
      case Action.Cancel:
        setState(() {
          _chiose = 'Cancel';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('your choice is :$_chiose'),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('open alertdialog'),
                  onPressed: _openAlertDialog,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
