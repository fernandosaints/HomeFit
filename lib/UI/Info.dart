import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String title;
  final Color color;

  const Info({this.title, this.color});

  Widget _displayText(){
    return Container(
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Text("O plano iniciante foi planejado para aqueles que malham uma vez por semana.", 
              style: TextStyle(fontSize: 25,color: Colors.black)),),
          ],),
          SizedBox(height: 30,),
          Row(children: <Widget>[
            Expanded(
              child: Text("O plano intermediário foi planejado para aqueles que malham de 2 a 3 vezes por semana.", 
              style: TextStyle(fontSize: 25, color: Colors.black)),),
          ],),
          SizedBox(height: 30,),
          Row(children: <Widget>[
            Expanded(
              child: Text("O plano avançado foi planejado para aqueles que malham de 4 a 6 vezes por semana.", 
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
        title: Text("Detalhes"),
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
                          _displayText(),
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
