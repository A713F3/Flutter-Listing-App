import 'package:flutter/material.dart';
import 'package:notes/pages/home.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home' : (context) => Home(),
    },
  ));
}


