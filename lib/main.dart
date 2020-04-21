import 'package:flutter/material.dart';
import 'package:home_fit/UI/Exercicios.dart';
import 'package:home_fit/UI/LoginPage.dart';
import 'package:home_fit/UI/Perfil.dart';
import 'package:home_fit/UI/ScaleRoute.dart';
import 'package:home_fit/Util/exercicos_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomeFit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('HomeFit', style: TextStyle(color:Colors.black),),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Perfil(
                  email: 'fsantos@gmail.com',
                  uid: '1',
                  displayName: 'Fernando',
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage())),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'Bem-vindo\n${"Fernando"}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    color: Colors.green,
                    child: Text(
                      'Iniciante',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => {
                      _onExercicioselect(
                      context,
                      'Iniciante',
                      inicianteExercicios,
                      Colors.green
                      ),
                    }
                  ),
                ),
              ),

              // Intermediário Button
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    color: Colors.blue,
                    child: Text(
                      'Intermediário',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => {
                     _onExercicioselect(
                      context,
                      'Intermediário',
                      intermediarioExercicios,
                      Colors.blue,
                    ),}
                  ),
                ),
              ),

              // Avançado Button
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    color: Colors.deepPurple,
                    child: Text(
                      'Avançado',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => {
                    _onExercicioselect(
                      context,
                      'Avançado',
                      avancadoExercicios,
                      Colors.deepPurple[400],
                    ),
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onExercicioselect(
    BuildContext context,
    String title,
    List<String> exercicios,
    Color color,
  ) async {
    Navigator.push(
      context,
      ScaleRoute(
        page: Exercicios(
          title: title,
          exercicios: exercicios,
          color: color,
        ),
      ),
    );
  }
}
