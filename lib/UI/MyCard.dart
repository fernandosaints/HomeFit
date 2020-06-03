import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String exercicio;
  final Color color;

  const MyCard({this.exercicio, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child:Container(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/" + exercicio + ".gif",
                fit: BoxFit.contain,
              ),
            )
          ),
          Text(
            exercicio,
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}
