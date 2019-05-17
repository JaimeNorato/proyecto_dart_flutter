import 'package:flutter/material.dart';
import 'package:proycto_dart_flutter/screens/myHomePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto en Platzi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'proyecto Dart en Platzi'),
    );
  }
}