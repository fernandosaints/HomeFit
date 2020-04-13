import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String text;
  final Color color;

  const MyCard({this.text, this.color});

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Image.asset(
            //   "assets/",
            //   fit: BoxFit.contain,
            // ),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}
