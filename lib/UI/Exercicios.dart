import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:home_fit/UI/MyCard.dart';

class Exercicios extends StatelessWidget {
  final String title;
  final Color color;

  const Exercicios({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
        child: Container(
          height: 500,
          child: Swiper(
            itemCount: 4,
            loop: false,
            viewportFraction: 0.8,
            scale: 0.82,
            outer: true,
            pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(32.0),
            ),
            //onTap: (index) => {},
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Container(
                  height: 360,
                  child: MyCard(
                    text: 'Nome do Exercício',
                    color: color,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
