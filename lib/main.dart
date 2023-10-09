import 'package:flutter/material.dart';
import 'package:time_app/pages/choose_location.dart';
import 'package:time_app/pages/home.dart';
import 'package:time_app/pages/loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false, // Set this to false to remove the debug banner
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));
