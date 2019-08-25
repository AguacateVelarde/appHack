import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientesPage extends StatefulWidget {
  ClientesPage({Key key}) : super(key: key);

  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  Color color = Color.fromRGBO(114, 100, 201, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 20),
              child: Text('Clientes',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 28.0,
                      color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: color, width: 3.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 10.0),
                      height: 150,
                      width: 220,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.people,
                              size: 40.0,
                            ),
                            Text('2749',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25.0)),
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Número de clientes en el periodo',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13.0),
                                    textAlign: TextAlign.center))
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:18.0, bottom: 20),
                      child: Text('Tus mejores clientes', textAlign: TextAlign.center, style: TextStyle( color: Colors.black, fontSize: 20.0)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _cardBase(Colors.green, Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.star_border, color: Colors.white,),
                            Text('\$2424', style: TextStyle( fontSize:  20.0)),
                            Text('ScotianBank', style: TextStyle( fontSize: 20.0),)
                          ],
                        )),
                        _cardBase(Colors.blue, Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.star_border, color: Colors.white,),
                            Text('\$2424', style: TextStyle( fontSize:  20.0)),
                            Text('ScotianBank', style: TextStyle( fontSize: 20.0),)
                          ],
                        ))
                      ],
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _cardBase(Colors.green, Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.star_border, color: Colors.white,),
                            Text('\$2424', style: TextStyle( fontSize:  20.0)),
                            Text('ScotianBank', style: TextStyle( fontSize: 20.0),)
                          ],
                        )),
                        _cardBase(Colors.blue, Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.star_border, color: Colors.white,),
                            Text('\$2424', style: TextStyle( fontSize:  20.0)),
                            Text('ScotianBank', style: TextStyle( fontSize: 20.0),)
                          ],
                        ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardBase( Color color, Widget child ){
    return Container(
      width: MediaQuery.of(context).size.width * 0.5 - 30,
      height: 150,
      child: Card(
         shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        color: color,
        child : child 
      ),
    );
  }
}
