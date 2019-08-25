import 'package:flutter/material.dart';
import 'package:kompass/src/pages/cliente.dart';
import 'package:kompass/src/pages/facturacion.dart';
import 'package:kompass/src/pages/perfil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int _currentIndex = 1;
 List<Widget> _listWidget = [
   Facturacion(),
   PerfilPage(),
   ClientesPage()
 ];
 @override
 Widget build(BuildContext context) {
   return Scaffold(   
     body: _listWidget[_currentIndex], 
     bottomNavigationBar:  BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.assignment), title: Text('Facturas')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Perfil')),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text('Clientes')),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.deepPurple,
        onTap: (dt){ setState(()=>  _currentIndex = dt );},
      ),
   );
 }
  

  void onTabTapped(int index) {
    //setState(()=>{});
 }
}