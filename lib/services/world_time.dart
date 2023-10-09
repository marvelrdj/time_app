import 'dart:convert';

import 'package:http/http.dart';
//http keyword to use http functionalties

import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDaytime; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url}) {}

  Future<void> getTime() async {
    try {
      var link = Uri.parse("http://worldtimeapi.org/api/timezone/$url");
      // Make the request
      Response response = await get(link);

      Map data = jsonDecode(response.body);
      print(data);

      // Get properties from JSON
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      print(time);
    } catch (e) {
      print(e);
      time = 'could not get time';
    }
  }
}
