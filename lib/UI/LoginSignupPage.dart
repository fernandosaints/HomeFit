import 'package:flutter/material.dart';
import 'package:home_fit/Services/Authentication.dart';
import 'package:home_fit/Util/customTextField.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  _LoginSignupPageState createState() => new _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoading;
  bool _isLoginForm;
  
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          
          print('Signed up user: $userId');
          Alert(context: context,
            style: AlertStyle(isCloseButton: false),
            type: AlertType.success,
            title: "USUÁRIO CADASTRADO",
            desc: "Seu usuário foi cadastrado com sucesso.",
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
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          showForm(),
          showCircularProgress(),
        ],
      )
    );
  }

  Widget showCircularProgress() {
    if (_isLoading) {
      return Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
        child: CircularProgressIndicator()
      );
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showForm() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 90),
            showLogo(),
            SizedBox(height: 48.0),
            showEmailInput(),
            SizedBox(height: 8.0),
            showPasswordInput(),
            SizedBox(height: 24.0),
            showPrimaryButton(),
            showSecondaryButton(),
            showErrorMessage(),
          ],
        ),
      )
    );
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.red,
          height: 1.0,
          fontWeight: FontWeight.w300),
        );
    } 
    else {
      return new Container(height: 0.0);
    }
  }
  
  Widget showLogo(){
    return Container(child: Image.asset('assets/logo.png'));
  }

  Widget showEmailInput(){
    return CustomTextField(
      icon: Icon(Icons.email),
      validator: (value) => value.isEmpty ? "* Email necessário" : null,
      onSaved: (value) => _email = value.trim(),
      hint: "Email",
    );
  }

  Widget showPasswordInput(){
    return CustomTextField(
      icon: Icon(Icons.lock),
      obsecure: true,
      validator: (value) => value.isEmpty ? "* Senha necessária" : null,
      onSaved: (value) => _password = value.trim(),
      hint: "Senha"
    );
  }

  Widget showPrimaryButton(){
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(12),
      color: Colors.blue,
      child: Text(_isLoginForm ? 'Login' : 'Cadastrar', style: TextStyle(color: Colors.white, fontSize: 20)),
      onPressed: validateAndSubmit,
    );
  }

  Widget showSecondaryButton(){
    return new FlatButton(
        child: new Text(
            _isLoginForm ? 'Criar uma conta' : 'Já possui uma conta? Login',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: toggleFormMode);
  }
}