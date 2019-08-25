import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:kompass/src/pages/facturacion.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key}) : super(key: key);

  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  ScrollController _controller;
  Color clr = Colors.white;
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(child: buildCustomScrollView()),
    );
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 70.0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(0.0),
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Perfil",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 22.0,
                      )),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        SliverFixedExtentList(
          itemExtent: 1000,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [facturacionBuild(), finanzasBuild()]);
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }

  _scrollListener() {
    if (_controller.offset > _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        clr = Colors.red;
      });
    }

    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        clr = Colors.lightGreen;
      });
    }
  }

  Widget facturacionBuild() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text('Facturación',
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 24.0,
                  color: Colors.black)),
        ),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[_circularChart(), _labels()],
          ),
        )
      ],
    );
  }

  Widget _labels() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Etiquetas',
            style: TextStyle(fontSize: 20.0, color: Colors.black)),
        SizedBox(
          height: 10.0,
        ),
        label('Ventas', Color.fromRGBO(88, 97, 195, 1)),
        SizedBox(
          height: 10.0,
        ),
        label('Gastos', Color.fromRGBO(0, 194, 162, 1)),
        SizedBox(
          height: 10.0,
        ),
        label('Ganancias', Color.fromRGBO(255, 204, 102, 1),),
      ],
    ));
  }

  Widget _circularChart() {
    return AnimatedCircularChart(
      key: _chartKey,
      size: const Size(200.0, 200.0),
      initialChartData: <CircularStackEntry>[
        CircularStackEntry(
          <CircularSegmentEntry>[
            CircularSegmentEntry(
              33.33,
              Color.fromRGBO(88, 97, 195, 1),
              rankKey: 'completed',
            ),
            CircularSegmentEntry(
              33.33,
             Color.fromRGBO(0, 194, 162, 1),
              rankKey: 'remaining',
            ),
            CircularSegmentEntry(
              33.33,
              Color.fromRGBO(255, 204, 102, 1),
              rankKey: 'remaining',
            )
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Pie,
      percentageValues: true,
    );
  }

  Widget finanzasBuild() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20.0, bottom: 20.0),
            child: Text('Tus finanzas',
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 24.0,
                    color: Colors.black)),
          ),
          _cuadritos()
        ]);
  }

  Widget _cuadritos() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            smallCuadritos(
              Icons.data_usage, '\$9,0000,000', 'Tu mejor cliente', false),
            smallCuadritos(
                Icons.check, '\$9,0000,000', 'Tu venta más grande', true)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            smallCuadritos(
                Icons.poll, '\$9,0000,000', 'Mayor gasto', true),
            smallCuadritos(
                Icons.graphic_eq, '\$9,0000,000', 'Menor gasto', false)
          ],
        ),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            smallCuadritos(
                Icons.payment, '\$9,0000,000', 'Iva cobrado', false),
            smallCuadritos(
                Icons.payment, '\$9,0000,000', 'Iva pagado', true)
          ],
        )
      ],
    );
  }

  Widget smallCuadritos(IconData icon, String quantity, String text, bool type) {
    const color = Color.fromRGBO(114, 100, 201, 1);
    return Card(      
      color: type ? color : Colors.white,
      shape: RoundedRectangleBorder(borderRadius:  BorderRadius.all(Radius.circular(20.0) ),),     
      child: Container(        
          width: MediaQuery.of(context).size.width * 0.5 - 40.0,
          height: 130.0,
          decoration:
              BoxDecoration(border: Border.all(color: color, width: 3.0),  borderRadius: BorderRadius.all(Radius.circular(20.0)),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Icon( icon , color: type ? Colors.white : Colors.black ),
            SizedBox(height: 10.0,),
            Text(quantity, style: TextStyle(fontSize : 15.0, color: type ? Colors.white : Colors.black)),
            SizedBox(height: 10.0,),
            Text(text, style: TextStyle(fontSize : 15.0, color:type ? Colors.white : Colors.black))
          ],)
          
          ),
    );
  }
  

}

Widget label(String text, Color _color) {
  return Row(children: <Widget>[
    Container(
      width: 10.0,
      height: 10.0,
      decoration: new BoxDecoration(
        color: _color,
        shape: BoxShape.circle,
      ),
    ),
    SizedBox(
      width: 10.0,
    ),
    Text(text, style: TextStyle(fontSize: 15.0, color: Colors.black))
  ]);
}
