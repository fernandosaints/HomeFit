import 'dart:io';
import 'package:flutter/material.dart';
import 'package:home_fit/Services/AppLocalizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  File _image;
  final picker = ImagePicker();

  @override
  void initState() {

    super.initState();
  }
  
  Future getImage() async {

    final pickedFile = await picker.getImage(source: ImageSource.camera);
    
    super.setState(() {
      _image = File(pickedFile.path);
    });
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
              Icons.add_a_photo,
              color: Colors.black,
            ),
            onPressed: getImage,
          )
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
                          CircularPercentIndicator(
                            radius: 120.0,
                            lineWidth: 13.0,
                            animation: true,
                            animationDuration: 600,
                            percent: 0.7,
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
                                  "7",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26.0,
                                  ),
                                ),
                              ],
                            ),
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
