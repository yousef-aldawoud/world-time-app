import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading";
  bool connected = true;
  void getWorldTime() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none){
      this.setState(() {
        this.connected = false;
      });
      return;
    }

    this.setState(() {
      this.connected = false;
    });

    WorldTime worldTime = WorldTime(location: "Auckland",flag: "New Zealand",url: "Pacific/Auckland");
    await worldTime.getTime();
    this.setState(() {
      this.time = worldTime.time;
    });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':worldTime.location,
      'flag':worldTime.flag,
      'time':worldTime.time,
      'isDaytime':worldTime.isDaytime,
    });
  }

  @override
  void initState() {
    getWorldTime();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List colChildren;
    if(this.connected){
       colChildren = <Widget>[
        SpinKitPouringHourglass(
          color: Colors.white,
          size: 50.0,
        ),
      ];
    }else{
      colChildren = <Widget>[
        Text("There is no internet connection.", style: TextStyle(color: Colors.white),),
        FlatButton(onPressed: (){
          this.getWorldTime();
        }, child: Text("Retry",style: TextStyle(color: Colors.white),),color: Colors.green[500],),
      ];
    }

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(

          child: Column(
            children: colChildren,
          )
        ),
      ),
    );
  }


}
