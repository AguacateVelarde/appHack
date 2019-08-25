import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController birthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(114, 100, 201, 1),
        body: SafeArea(
            child: Stack(
          children: <Widget>[_cardsRegister()],
        )),
        bottomNavigationBar: Container(
            height: 100.0,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '¿YA tienes cuenta?',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(
                  width: 10.0,
                ),
                GestureDetector(
                  child: Text('Inicia sesión',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800)),
                  onTap: () {
                    Navigator.of(context).pushNamed('login');
                  },
                )
              ],
            ))));
  }

  Widget _cardsRegister() {
    return ListView(
      children: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 70.0),
                child: Text('Bienvenido',
                    style: Theme.of(context).textTheme.body1,
                    textAlign: TextAlign.end),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Column(children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) return 'Campo vacío';
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white),
                    prefixStyle: TextStyle(color: Colors.white),
                    labelText: 'Nombre',
                    labelStyle: TextStyle(color: Colors.white), 
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Correo',
                      labelStyle: TextStyle(color: Colors.white), 
                      )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (!value.contains('@')) return 'Error con la contraseña';
                    return null;
                  },
                  obscureText: true,                  
                  decoration: InputDecoration(  
                    labelStyle: TextStyle(color: Colors.white),  
                    labelText: 'Contraseña',                             
                  )),
            ),
          ]),
          SizedBox(height: 20.0),
          SizedBox(
              width: 300.0,
              height: 45.0,
              child: RaisedButton(
                  child: Text(
                    'Ingresar',
                    style: TextStyle(
                        fontSize: 17.0, color: Color.fromRGBO(92, 90, 146, 1)),
                  ),
                  onPressed: () {},
                  textColor: Colors.white,
                  color: Color.fromRGBO(244, 245, 246, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)))),
          SizedBox(height: 30.0),
        ]),
      ],
    );
  }
}
