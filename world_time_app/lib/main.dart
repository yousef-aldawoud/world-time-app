import 'package:flutter/material.dart';
import 'package:world_time_app/Pages/Home.dart';
import 'package:world_time_app/Pages/Loading.dart';
import 'package:world_time_app/Pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => Loading(),
    '/home':(context)=>Home(),
    '/location':(context)=>ChooseLocation(),
  },
));
