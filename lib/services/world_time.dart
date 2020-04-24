import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;//location name for this Ui
  String time; //Utc time
  String flag,url;
  bool isDay; // true if day false if night
  WorldTime( { this.location,this.flag,this.url});

  Future<void> getDate() async
  {
    try
    {
      Response response= await get('https://worldtimeapi.org/api/timezone/$url').timeout(Duration(seconds: 5));
      Map data=jsonDecode(response.body);
      print(data);
      //get data properties from data
      String datetime=data['datetime'];
      String offseth=data['utc_offset'].substring(1,3);
      String offsetm=data['utc_offset'].substring(4,6);
      //print(datetime);
      //print(offseth);
      //print(offsetm);
      DateTime now= DateTime.parse(datetime);
      //print(now);
      //offset will print +05:00 +0 is not needed
      now=now.add(Duration(hours: int.parse(offseth)));
      now=now.add(Duration(minutes: int.parse(offsetm)));
      //time=now.toString();//set time property

      isDay=now.hour>6 && now.hour < 20?true:false;
      print('Data : $now.hour');
      time=DateFormat.jm().format(now);
    }
    catch(e)
    {
      print('caught error error $e');
      time= 'Could not get data';
      isDay=true;
    }

  }


}

