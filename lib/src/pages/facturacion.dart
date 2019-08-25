import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kompass/src/widgets/carousel.dart';

class Facturacion extends StatefulWidget {
  const Facturacion({Key key}) : super(key: key);

  @override
  _FacturacionState createState() => _FacturacionState();
}

class _FacturacionState extends State<Facturacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(87, 75, 168, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 20),
          child: ListView(
            children: <Widget>[
              Text('Facturación',
                  style:
                      TextStyle(fontWeight: FontWeight.w300, fontSize: 28.0)),
              CardSwiper(<Widget>[
                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                            size: 70.0,
                            color: Colors.white,
                          ),
                          Text('\$341231',
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 30,
                          ),
                          Text('Gasto',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w100))
                        ]),
                    color: Color.fromRGBO(114, 100, 201, 1)),
                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                            size: 70.0,
                            color: Colors.white,
                          ),
                          Text(
                            '\$341231',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Gasto',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w100),
                          ),
                        ]),
                    color: Color.fromRGBO(4, 180, 154, 1)),
                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                            size: 70.0,
                            color: Color.fromRGBO(87, 75, 168, 1),
                          ),
                          Text('\$341231',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(87, 75, 168, 1))),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Gasto',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w100,
                                color: Color.fromRGBO(87, 75, 168, 1)),
                          )
                        ]),
                    color: Color.fromRGBO(244, 245, 246, 1))
              ]),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 40.0),                
                height: 180,
                width: 220,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.local_shipping, size: 40.0,),
                      Text('2749', style : TextStyle( color: Colors.black, fontSize: 25.0)),
                      Padding( 
                        padding: EdgeInsets.all(8.0),
                        child : Text('Número de proveedores en el periodo', style : TextStyle( color: Colors.black, fontSize: 13.0), textAlign: TextAlign.center) )
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                ),
              ),
              _ventas(),
              _gastos()
            ],
          ),
        ),
      ),
    );
  }

  Widget _ventas(){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text('Ventas', style: TextStyle( color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w300 ))
          ]),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          _cardLarge(Icons.check, '\$55555', 'Tu cliente más grande por facturar', 'ScotianBank', true),
          _cardLarge(Icons.check, '\$55555', 'Tu cliente más grande por facturar', 'ScotianBank', false)
        ],)
      ],
    );
  }

  Widget _gastos(){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text('Gastos', style: TextStyle( color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w300 ))
          ]),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          _cardLarge(Icons.check, '\$55555', 'Tu cliente más grande por facturar', 'ScotianBank', false),
          _cardLarge(Icons.check, '\$55555', 'Tu cliente más grande por facturar', 'ScotianBank', true)
        ],)
      ],
    );
  }

  Widget _cardLarge(
    IconData icon, String money, String description, String client, bool type
  ){
  

    const color = Color.fromRGBO(114, 100, 201, 1);
    return Card(      
      color: type ? color : Colors.white,
      shape: RoundedRectangleBorder(borderRadius:  BorderRadius.all(Radius.circular(20.0) ),),     
      child: Container(        
          width: MediaQuery.of(context).size.width * 0.5 - 40.0,
          height: 260.0,
          decoration:
              BoxDecoration(border: Border.all(color: color, width: 3.0),  borderRadius: BorderRadius.all(Radius.circular(20.0)),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Icon( icon , color: type ? Colors.white : Colors.black ),
            SizedBox(height: 20.0,),
            Text(money, style: TextStyle(fontSize : 15.0, color: type ? Colors.white : Colors.black)),
            SizedBox(height: 20.0,),
            Text(description,textAlign: TextAlign.center,  style: TextStyle(fontSize : 15.0, color:type ? Colors.white : Colors.black)),
            SizedBox( height:  20.0 ,),
            Text(client, textAlign: TextAlign.center, style: TextStyle(fontSize : 15.0, color:type ? Colors.white : Colors.black)),
          ],)
          
          ),
    );
  }
}
