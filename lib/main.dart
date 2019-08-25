import 'package:flutter/material.dart';
import 'package:kompass/src/pages/home.dart';
import 'package:kompass/src/pages/login.dart';
import 'package:kompass/src/pages/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = '';

  @override
  void didChangeDependencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(()=> token = prefs.getString('token'));
     //print('Tokenizado $token' );
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: token != '' ? 'home' :'login',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'login' : (BuildContext context ) => LoginPage(),
        'register' : (BuildContext context ) => RegisterPage()
      },
      theme: ThemeData(
        fontFamily: 'Montserrat',
       primarySwatch: Colors.grey,
        textTheme : TextTheme(
            body1: new TextStyle(
              color: white,
              fontFamily: 'San Francisco',
              fontSize: 40.0,
              fontWeight: FontWeight.w600,
              
            ),
      ),
    ));
  }
}