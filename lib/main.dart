import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location_page.dart';
import 'package:world_time_app/pages/home_page.dart';
import 'package:world_time_app/pages/loading_page.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/homePage',
  routes: {
    '/': (context) => LoadingPage(),
    '/homePage' : (context) => HomePage(),
    '/chooseLocationPage': (context) => ChooseLocationPage()
  },
));

