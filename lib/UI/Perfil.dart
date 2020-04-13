import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
  bool _editMode = false;
  TextEditingController _displayNameController;
  String _titleText;
  String _displayName;

  @override
  void initState() {
    _displayNameController = TextEditingController(
      text: widget.displayName,
    );

    _titleText = 'Perfil';

    _displayName = widget.displayName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_titleText),
        centerTitle: true,
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
                  color: Colors.blueGrey[200],
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
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  AnimatedSwitcher(
                                    duration: Duration(milliseconds: 100),
                                    child: _editMode
                                        ? _editNameWidget()
                                        : _displayNameWidget(
                                            _displayName,
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Level
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
                                  "Level",
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
                      color: Colors.blueGrey[100],
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
                        radius: 60,
                      ),
                    ),

                    // Edit Button
                    Positioned(
                      right: 0.0,
                      bottom: 0.0,
                      child: AnimatedContainer(
                        margin: EdgeInsets.fromLTRB(
                          0,
                          0,
                          _editMode ? 0 : 15,
                          _editMode ? 0 : 15,
                        ),
                        duration: Duration(milliseconds: 100),
                        height: _editMode ? 32 : 0,
                        width: _editMode ? 32 : 0,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: FloatingActionButton(
                          heroTag: null,
                          elevation: 0.0,
                          backgroundColor: Colors.blueGrey[100],
                          child: Icon(
                            Icons.edit,
                            color: Colors.blueGrey[700],
                            size: _editMode ? 19 : 0,
                          ),
                          onPressed: () => {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Edit Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(
          _editMode ? Icons.done : Icons.edit,
          color: Colors.blueGrey[900],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _displayNameWidget(String displayName) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 200,
        padding: EdgeInsets.fromLTRB(0, 12.0, 3.0, 12.0),
        child: Text(
          displayName,
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  Widget _editNameWidget() {
    return Container(
      width: 200,
      child: TextField(
        autofocus: true,
        style: TextStyle(
          fontSize: 25,
        ),
        controller: _displayNameController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(),
      ),
    );
  }
}
