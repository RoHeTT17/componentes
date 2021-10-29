import 'package:flutter/material.dart';
import 'dart:async';


class ListaPage extends StatefulWidget {

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = [];//[1,2,3,4,5];
  int _ultimoItem = 1;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _crear10();

    _scrollController.addListener(() {
    //Si la posición actual del scroll es igual a la máxima, volver a cargar  imagenes
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent)
          // para el ejemplo del infiniteScroll
          //_crear10();
          //Para ejemplo una petición http
          _fetchData();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listas"),
        ),
        body: Stack(
            children: <Widget>[
                _crearLista(),  
                _crearLoading(),
            ]
        ),

    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh:obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length, //indica cuantos elementos tiene la lista en este momento
        itemBuilder: (BuildContext context,int index){
          final imagen = _listaNumeros[index]; //obtener el valro del elemento
    
          return FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"), 
            image: NetworkImage("https://picsum.photos/500/300?random=$imagen"), 
        );
      }),
    );
  }

  Future obtenerPagina1() async{

      final duration = new Duration(seconds: 2);
      new Timer(duration, (){
          _listaNumeros.clear();
          _ultimoItem++;
          _crear10;
          });

    return Future.delayed(duration);
  }

  void _crear10(){
    for (var i = 1; i < 10; i++) {
      _ultimoItem+=10;//+;
      _listaNumeros.add(_ultimoItem);
    }

    //Se llama el setState para indicar que cambio el Widget
    setState(() {
      
    });
  }

  Future _fetchData() async{

      _isLoading = true;

      //Como cambio la propiedad a true y se quiere actualziar el DOM y
      //se quiere mostrar un widget que se encargue de mostrar el loading
      //se ejecuta el setState
      setState(() {});
      
      final duration =new Duration(seconds: 2);
      //al pasar los 2 segundos, se llama el método respuestaHttp
      return new Timer(duration,respuestaHttp);

  }

  void respuestaHttp(){
        
    _isLoading = false;

    //Cuando termina de cargar la Data, hacer que el Scroll avance un poco
    _scrollController.animateTo(
      _scrollController.position.pixels+100, 
      duration: Duration(microseconds: 250),
      curve: Curves.fastOutSlowIn);

    _crear10();
  
  }

  Widget _crearLoading() {

    if (_isLoading){
      //return CircularProgressIndicator();
      //Centrar el loading
      return Column(
        mainAxisSize: MainAxisSize.max, //Ocupe todo el espacio
        mainAxisAlignment: MainAxisAlignment.end, // lo coloque al final(Abajo)
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0,) //también se pudo agregar un padding
        ],
      );
    }else
      return Container();
  }

}