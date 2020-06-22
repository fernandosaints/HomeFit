import 'dart:io';
import 'package:flutter/material.dart';
import 'package:home_fit/Services/AppLocalizations.dart';
import 'package:home_fit/UI/CalendarScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'Nivel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:async';
import 'package:flutter/services.dart';

final nivel = Nivel();
File _image;

class Perfil extends StatefulWidget {
  final String email;
  final String uid;
  final String displayName;

  Perfil({
    this.email,
    this.uid,
    this.displayName,
  });

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  
  String _titleText;
  static const platform = const MethodChannel('Homefit.flutter.dev/battery');

  final picker = ImagePicker();

  String _batteryLevel = '??%';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '$result%';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future getImage() async {

    final pickedFile = await picker.getImage(source: ImageSource.camera);
    
    super.setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(_image != null){
      precacheImage(FileImage(_image), context);
    }
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(AppLocalizations.of(context).profile, style: TextStyle(color:Colors.black),),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.battery_unknown
              ),
              onPressed: _getBatteryLevel,
            ),
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.black,),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CalendarScreen(),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              color: Colors.black,
            ),
            onPressed: getImage,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              // Details Card
              Container(
                width: double.infinity,
                child: Card(
                  color: Color(0xFFF7F7F7),
                  margin: EdgeInsets.only(top: 60.0, bottom: 28.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28.0, 90.0, 28.0, 16.0),
                    child: Container(
                      height: 460,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Display Name
                          Text(widget.displayName, style: TextStyle(fontSize: 25),),

                          //Display Infos
                          Column(
                            children: <Widget>[
                              Text("Email:  "+widget.email),
                              Divider(),
                              Text(AppLocalizations.of(context).height+":     "+"1.81"),
                              Divider(),
                              Text(AppLocalizations.of(context).weight+":     "+"65kg"),
                              Divider(),
                              Text(AppLocalizations.of(context).gender+":     "+"M"),
                            ],
                          ),
                          
                          // Nível
                          Observer(
                            builder: (_) => CircularPercentIndicator(
                            radius: 120.0,
                            lineWidth: 13.0,
                            animation: true,
                            animationDuration: 600,
                            percent: nivel.xp/(nivel.nivel*300),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.indigo[400],
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context).level,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${nivel.nivel}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(_batteryLevel),
                              Icon(Icons.battery_full),
                            ]
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Avatar
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70.0),
                    border: Border.all(
                      color: Colors.black,//Colors.blueGrey[100],
                      width: 6.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0,
                      ),
                    ]),
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: 'Perfil',
                      child: CircleAvatar(
                        backgroundColor: Colors.lightBlueAccent,
                        backgroundImage: _image == null ? AssetImage('assets/avatar.png') : FileImage(_image),
                        radius: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayNameWidget(String text) {
    return Theme(
      data: ThemeData(
        accentColor: Colors.red
      ),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: 200,
          padding: EdgeInsets.fromLTRB(0, 12.0, 3.0, 12.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      )
    );
  }
}
