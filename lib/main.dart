import 'package:flutter/material.dart';
import 'page/home.dart';
import 'page/choose_location.dart';
import 'page/loading.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  //home: Home(),
  routes: {
    '/':(context) => Loading(),
    '/home':(context)=>Home(),
    '/location':(context)=>ChooseLocation(),
  },

));

