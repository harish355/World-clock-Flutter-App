import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> location=
  [
  WorldTime(location: 'Kolkata',flag: 'ind.jpg',url:'Asia/Kolkata'),
  WorldTime(location: 'New_york_city',flag: 'new.jpg',url:'America/New_york'),
  WorldTime(location: 'Chicago',flag: 'chic.png',url:'America/Chicago'),
  WorldTime(location: 'London',flag: 'london.png',url:'Europe/London'),
  WorldTime(location: 'Cario',flag: 'cario.png',url:'Africa/Cario'),
  WorldTime(location: 'Seoul',flag: 'seoul.jpg',url:'Asia/Seoul'),
  WorldTime(location: 'Hong Kong',flag: 'china.jpg',url:'Asia/Hong_Kong'),
  WorldTime(location: 'Bulgaria',flag: 'bul.png',url:'Europe/Rome'),
  ];
  void update(index) async
  {
    WorldTime intant= location[index];
    await intant.getDate();
    Navigator.pop(context,
    {
      'time': intant.time,
      'flag': intant.flag,
      'location': intant.location,
      'isDay' : intant.isDay,
    });
  }
  @override

  Widget build(BuildContext context) {
     //print('build state ran');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Choose your location'),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: location.length,
          itemBuilder: (context,index)
      {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: ListTile(
            onTap: (){
              update(index);

            },
            title: Text(location[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assests/${location[index].flag}'),
              ),
            ),
          ),
        );
      })
    );
  }
}


