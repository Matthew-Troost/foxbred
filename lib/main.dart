import 'package:flutter/material.dart';
import 'package:foxbred/services/authentication.dart';
import 'package:foxbred/screens/root.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter login demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Root(auth: new Auth()));
  }
}