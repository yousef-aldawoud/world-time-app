import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    this.data = data.isNotEmpty ?  data:ModalRoute.of(context).settings.arguments;

    Color bgColor = data["isDaytime"] ? Colors.grey[100] : Colors.blue[900];
    Color fontColor = data["isDaytime"] ? Colors.black : Colors.white;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(

                label: Text("Edit location", style: TextStyle(color: fontColor,),),
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context,'/location');
                  setState(() {
                    data = {
                      'time':result['time'],
                      'location':result['location'],
                      'isDaytime':result['isDaytime'],
                      'flag':result['flag'],
                    };
                  });
                },
                icon:Icon(Icons.edit_location,color: fontColor,),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    this.data["location"],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: fontColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66,
                  color: fontColor,
                ),
              )
            ],
          ),
        ),

      ),
      backgroundColor: bgColor,
    );
  }
}
