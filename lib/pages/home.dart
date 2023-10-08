import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {
    'isDaytime': true,
    'otherData': 'some value',
  };

  @override
  Widget build(BuildContext context) {
    Color? bgColor;
    String bgImage;

    // Retrieve the data from ModalRoute and cast it to Map<String, dynamic>?
    Map<String, dynamic>? routeData = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (routeData != null) {
      // Now you can safely access the data
      bgImage = routeData['isDaytime'] ? 'day.png' : 'night.png';
      bgColor = routeData['isDaytime'] ? Colors.blue : Colors.indigo[700];
      // ...
    } else {
      // Handle the case where routeData is null or empty
      // Set default values for bgImage and bgColor
      bgImage = 'day.png'; // You can use a default image here
      bgColor = Colors.blue; // You can use a default color here
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                // ... rest of your code ...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
