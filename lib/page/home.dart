import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    print('final $data');

    //set background
    String image= data['isDay']? 'day.png': 'night.png';
    Color bg =data['isDay']?Colors.blue:Colors.indigo[700];
    return Scaffold(
      backgroundColor: bg,
      body:SafeArea(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assests/$image'),
          fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
//              FlatButton.icon(
//                  onPressed: ()
//                {
//                  Navigator.pushNamed(context, '/location');
//                },
//                  icon: Icon(
//                      Icons.edit_location),
//                  label: Text('next Page',
//                    style: TextStyle(
//                    color:Colors.black87,),),
//              ),
              SizedBox(height: 20,),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(data['location'],
//                style: TextStyle(
//                  fontSize: 28,
//                  letterSpacing: 2.0,
//                ),),
//              ],
//            ),
              SizedBox(height:350),
            Center(

              child:Text(data['location'],
                  style: TextStyle(
                    fontSize: 38,
                    letterSpacing: 2.0,
                    color:Colors.black,
                  ),)),
            //)
              SizedBox(height:20),
              Text(data['time'],
              style: TextStyle(
                fontSize: 55,
                letterSpacing: 2.0,
                color:Colors.black,
              ),),
              FlatButton.icon(
                onPressed: () async
                {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data={
                      'time': result['time'],
                      'flag': result['flag'],
                      'location': result['location'],
                      'isDay' : result['isDay'],
                    };
                  });
                },
                icon: Icon(
                    Icons.edit_location,
                size: 40,),
                label: Text('Chose Your location',
                  style: TextStyle(
                    fontSize: 25,
                    color:Colors.black87,),),
              ),

            ],
          ),
        ),
      )),
    );
  }
}


