import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:home_fit/UI/HomePage.dart';
import 'package:home_fit/UI/MyCard.dart';

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
      ),
      body: Center(
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
    );
  }

  void _onSelect(BuildContext context, String customModelName) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage()
      ),
    );
  }
}
