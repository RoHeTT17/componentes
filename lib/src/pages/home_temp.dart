import 'package:flutter/material.dart';

class HomePAgeTemp extends StatelessWidget {

  final opciones = ['1','2','3','cuatro','cinco','6','siete'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        //children: _crearItem() //forma 1
        children: _crearItemsFormaCorta() //forma 2
      ),
    );
  }

  //Forma 1 de hacerlo
  List<Widget> _crearItem(){

     List<Widget> listaWidget=[];

    for (String item in opciones) {

       final tempWidget= ListTile(
          title: Text(item),
        );

     //Forma normal
      /*listaWidget.add(tempWidget);
      listaWidget.add(Divider(
        height: 10.0,
        color: Colors.blue[100],
      ));*/

     //Con operador cascada 
      listaWidget..add(tempWidget)
                 ..add(Divider(
                      height: 10.0,
                      color: Colors.blue[100],
                    ));

    }

    return listaWidget;
  }

  //Forma 2 de hacerlo
  List<Widget> _crearItemsFormaCorta(){

   //forma 2.1 
    /*var widget = opciones.map((e){

       return ListTile(
         title: Text(e + '!'),
         //title: Text('$e 5'),
       ); 

    }).toList();

    return widget;*/

   //Forma 2.2
  return opciones.map((e){

       return Column(
         children: <Widget>[
           ListTile(
             title: Text(e + '!'),
             subtitle: Text('Cualquier cosa'),
             leading: Icon(Icons.ac_unit),
             trailing: Icon(Icons.keyboard_arrow_right), 
             onTap: (){},
             //title: Text('$e 5'),
           ),
           Divider()
         ],
       ); 

    }).toList();

  }

}