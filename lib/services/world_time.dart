import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime{

  //location name for UI
  late String location;

  //the time in that location
  late String time;

  //url to an asset flag icon
  late String flag;

  //location url for api endpoint
  late String url;

  //is daytime or not
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      //make the request
      Response response = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from requested data
      String dateTime = data['datetime'].toString();
      String utcOffset = data['utc_offset'].toString().substring(1, 3);

      //create DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(utcOffset)));

      //set the time property
      time = DateFormat.jm().format(now);

      //check if is daytime or not
      isDayTime = now.hour > 7 && now.hour < 19 ? true : false;
    }  catch (e) {
      time = 'Could not load time data';
    }
  }
}