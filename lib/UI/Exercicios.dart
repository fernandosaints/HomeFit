import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:home_fit/UI/HomePage.dart';
import 'package:home_fit/UI/Info.dart';
import 'package:home_fit/UI/MyCard.dart';
import 'package:home_fit/UI/ScaleRoute.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Perfil.dart';



class Exercicios extends StatelessWidget {
  final String title;
  final List<String> exercicios;
  final Color color;

  const Exercicios({this.title, this.exercicios, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: color,
        centerTitle: true,
        title: Text(title),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () => Navigator.push(
              context, ScaleRoute(page:Info(title: title,color: color)),
            ),
          ),
        ],
      ),
      body: Theme(
        data: ThemeData(
          primaryColor: color,
          accentColor: color,
        ),
        child: Center(
          child: Container(
            height: 500,
            child: Swiper(
              itemCount: 3,
              loop: false,
              viewportFraction: 0.8,
              scale: 0.82,
              outer: true,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(32.0),
              ),
              onTap: (index) => _onSelect(context, exercicios[index]),
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Container(
                    height: 360,
                    child: MyCard(
                      exercicio: exercicios[index],
                      color: Color(0xFFF7F7F7),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Alert(context: context,
            style: AlertStyle(isCloseButton: false),
            type: AlertType.success,
            title: "EXERCÍCIO REALIZADO!",
            desc: "Você recebeu +100XP.",
            buttons: [
              DialogButton(
                child: Text("Confirmar",style: TextStyle(color: Colors.white, fontSize: 20),),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color.fromRGBO(0, 179, 134, 1.0),
                radius: BorderRadius.circular(0.0),
              ),
            ],).show();
            nivel.GiveXP();
        },
        tooltip: 'AumentaXP',
        child: Icon(Icons.check),
        backgroundColor: color,
      ),
    );
  }

  void _onSelect(BuildContext context, String customModelName) async {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => HomePage()
    //   ),
    // );
  }
}
