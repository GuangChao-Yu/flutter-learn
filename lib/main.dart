import 'package:flutter/material.dart';
import './app.dart';
import './demo/navigator_demo.dart';
import './demo/form_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: NavigatorDemo(),
        initialRoute: '/form',
        routes: {
          '/': (context) => Home(),
          '/about': (context) => Page(title: 'About'),
          '/form': (context) => FormDemo()
        },
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
          splashColor: Colors.white30,
          accentColor: Color.fromRGBO(3, 54, 255, 1.0),
        ));
  }
}
