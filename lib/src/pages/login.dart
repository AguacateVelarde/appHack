import 'package:flutter/material.dart';
import 'package:kompass/src/services.dart/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum FormMode { LOGIN, SIGNUP }

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginSevice _loginService = LoginSevice();
  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(114, 100, 201, 1),
      body: SafeArea(
          child: Stack(
        children: <Widget>[_showBody(), _showCircularProgress()],
      )),
      bottomNavigationBar: Container(
          height: 100.0,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('¿No tienes ninguna cuenta?', style: TextStyle(color: Colors.white, fontSize: 14),),
              SizedBox(width: 10.0,),
              GestureDetector(
                child: Text('Regístrate', style: TextStyle( fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w800)), 
                onTap: () {
                  Navigator.of(context).pushNamed('register');
                },)
              ],
              
          ))),
    );
  }

  Widget _showBody() {
    return ListView(
      children: <Widget>[
        new Container(
          height: MediaQuery.of(context).size.height - 32,
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: new Form(
              key: _formKey,
              child: Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _showLogo(),
                    _showEmailInput(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _showPassword(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _showPrimaryButton()
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _showEmailInput() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.white),
      child: TextField(
          controller: emailController,
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Usuario o RFC",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: new BorderSide(),
            ),
          ),
          
      )
    );
  }

  Widget _showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: new MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 5.0,
          minWidth: MediaQuery.of(context).size.width * 0.8,
          height: 50.0,
          color: Color.fromRGBO(244, 245, 246, 1),
          child: Text('Iniciar sesión',
              style: new TextStyle(
                  fontSize: 20.0, color: Color.fromRGBO(92, 90, 146, 1))),
          onPressed: _validateAndSubmit,
        ));
  }

  Widget _showPassword() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.white),
      child: TextField(
        controller: passwordController,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Contraseña",
            labelStyle: TextStyle(color: Colors.black),
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: new BorderSide(),
            ),
          ),
      )
    );
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 90.0,
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }


  _validateAndSubmit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = true;
    });
   
    if (emailController.text != '' && passwordController.text != '') {
      var res = await _loginService.login(emailController.text, passwordController.text);
      if( res['message'] == 'Ok' ){
        prefs.setString('token', res['token']);
        Navigator.of(context).pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);
      }
      setState( () => _isLoading = false );
    } else {
      print('error');
      setState( () => _isLoading = false );
    }
  }
}
