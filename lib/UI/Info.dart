import 'package:flutter/material.dart';
import 'package:home_fit/Services/AppLocalizations.dart';

class Info extends StatelessWidget {
  final String title;
  final Color color;

  const Info({this.title, this.color});

  Widget _displayText(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Text(AppLocalizations.of(context).text1, 
              style: TextStyle(fontSize: 25,color: Colors.black)),),
          ],),
          SizedBox(height: 30,),
          Row(children: <Widget>[
            Expanded(
              child: Text(AppLocalizations.of(context).text2, 
              style: TextStyle(fontSize: 25, color: Colors.black)),),
          ],),
          SizedBox(height: 30,),
          Row(children: <Widget>[
            Expanded(
              child: Text(AppLocalizations.of(context).text3, 
              style: TextStyle(fontSize: 25, color: Colors.black)),),
          ],),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: color,
        centerTitle: true,
        title: Text(AppLocalizations.of(context).details),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () => {
              Navigator.popUntil(context, ModalRoute.withName('/')),
            }
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 460,
                      child: Column(
                        children: <Widget>[
                          _displayText(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
