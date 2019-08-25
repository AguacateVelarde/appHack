import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kompass/src/services/clientes.dart';
import 'package:kompass/src/services/truncate.dart';

class ClientesPage extends StatefulWidget {
  ClientesPage({Key key}) : super(key: key);

  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  Color color = Color.fromRGBO(114, 100, 201, 1);
  PerfilService _perfilService = PerfilService();
  List top ;
  bool _loading = true;
  double cantidad = 0;

  get cantida => null;
  @override
  void initState() {
    init();
    super.initState();
  }
  init() async {
    final data = await _perfilService.topClientes();
    setState(() => top = data[0] );
    final data_2 = await _perfilService.numClientes();
    setState((){
      cantidad = double.parse( data_2['NumProvedores'].toString());
      _loading = false;
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _loading ? 
      Center( child:  CircularProgressIndicator() )
      : ListView(children: <Widget>[
ready(context),
      ],)
      
      
    );
  }

  SafeArea ready(BuildContext context) {
    return SafeArea(
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
              child: body(),
            ),
          )
        ],
      ),
    );
  }

  Column body() {
    return Column(
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
                          Text(cantidad.toString(),
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
                    child: Text('Tus mejores clientes', textAlign: TextAlign.center, style: TextStyle( fontWeight: FontWeight.w300, color: Colors.black, fontSize: 20.0)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _cardBase(Color.fromRGBO(114, 100, 201, 1), Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(Icons.star_border, color: Colors.white,),
                          Text('\$${ format( top[0]['TotalClientes'] ) }', style: TextStyle( fontSize:  20.0)),
                          Text(top[0]['emisorname'].toString() == '' ? 'PEDRSA****' : top[0]['emisorname'].toString()  , style: TextStyle( fontSize: 20.0),)
                        ],
                      )),
                      _cardBase(Color.fromRGBO(177, 185, 193, 1), Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(Icons.star_border, color: Colors.white,),
                          Text('\$${ format(top[1]['TotalClientes']) }', style: TextStyle( fontSize:  20.0)),
                          Text(top[1]['emisorname'].toString() == '' ? 'PEDRSA****' : top[1]['emisorname'].toString()  , style: TextStyle( fontSize: 20.0),)
                        ],
                      ))
                    ],
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _cardBase(Color.fromRGBO(177, 185, 193, 1), Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(Icons.star_border, color: Colors.white,),
                          Text('\$${ format(top[2]['TotalClientes']) }', style: TextStyle( fontSize:  20.0)),
                          Text(top[2]['emisorname'].toString() == '' ? 'desconocido' : top[2]['emisorname'].toString()  , style: TextStyle( fontSize: 20.0),)
                        ],
                      )),
                      _cardBase(Color.fromRGBO(114, 100, 201, 1), Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(Icons.star_border, color: Colors.white,),
                          Text('\$${ format(top[3]['TotalClientes']) }', style: TextStyle( fontSize:  20.0)),
                          Text(top[3]['emisorname'].toString() == '' ? 'desconocido' : top[3]['emisorname'].toString()  , style: TextStyle( fontSize: 20.0),)
                        ],
                      ))
                    ],
                  )
                ],
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
