import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:http/http.dart';
//import 'dart:convert';
import 'package:world_clock/services/world_time.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='loding';
  void setup() async
  {
  WorldTime intant=WorldTime(location: 'Kolkata',flag: 'india.jpg',url:'Asia/Kolkata');
  await intant.getDate();
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    'time': intant.time,
    'flag': intant.flag,
    'location': intant.location,
    'isDay' : intant.isDay,

  });

  }
  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
    body:Center(
      child:SpinKitFadingCube(
        color: Colors.white,
        size: 80.0,
      ),
    ),
    );
  }
}