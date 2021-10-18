import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';

import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
      
    );
  }

  Widget _lista() {

      //print(menuProvider.opciones);

     /*
      //Esta opción no es recomendable para cargar los datos del ListView (iria dentro del método), porque si tarda mucho tiempo en cargar la
      //información podria parecer que la app esta trabada, cuando en realdiad esta cargando información.

      menuProvider.cargarData().then((rutas){
        print(rutas);

      });

      return ListView(
        children: _listaItems(),
      );*/

      return FutureBuilder(
        future: menuProvider.cargarData(),//La propiedad future tiene que estar enlazada a lo que queremos esperar, un Future
        initialData: [],//Es la información por defecto que mientra no se resuelva el Future. Este argumento es opcional
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){

          return ListView(
            children: _listaItems(snapshot.data,context),
          );
   
        });

  }

  List<Widget> _listaItems(List<dynamic>? data,BuildContext context) {
    
    /*A diferencia del tutorial se tuvo que agregar ? en el parametro y el for each 
    proque marcaba error Type 'List<dynamic>?' can't be assigned to the parameter type 'List<dynamic>'
    Esto fue puede ser por las diferencia en las versiones del Flutter, pero esencialmente fue por el nullsafety.

    ***** BuildContext contex

    En este caso se recibe el Builder del FutureBuilder porque ya tenemos esa referencia, de no tenerlo tendrias que estar mandandolo como 
    parámetro desde que se crea en  Widget build

    */   

    final List<Widget> opciones = [];

    data?.forEach((element) {

      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing:  Icon(Icons.keyboard_arrow_right),
        onTap: (){

            /*
            //Forma tradicional
            final route= MaterialPageRoute(builder:(context){
                return AlertPage();
            });*/


            //La función se puede resumir porque al tener solo la línea de return se puede usar =>
            /*final route= MaterialPageRoute(builder:(context)=> AlertPage());

            //Forma tradicional de navegar entre pages
            Navigator.push(context, route);*/

            //Navegar por rutas
            //Primero configurar las rutas
            Navigator.pushNamed(context, element['ruta']);

        },
      
      );

      opciones..add(widgetTemp)
              ..add(Divider()); 

    });

     return opciones;   

    /*return [
      ListTile(title: Text("Hola mundo"),),
      Divider(),
      ListTile(title: Text("Hola mundo"),),
      Divider(),
      ListTile(title: Text("Hola mundo"),),
      Divider(),
    ];*/
  }
}
