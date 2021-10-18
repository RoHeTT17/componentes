import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';



class _MenuProvider{
  List<dynamic> opciones =[];

/*Se hace privada porque solo se va a necesitar una instancia de este
 menú en toda la aplicación. Dicha instancia esta delcarada fuera de esta clase

*/


_MenuProvider(){
  //cargarData();
}

/* cargarData() {

   rootBundle.loadString('data/menu_opts.json').then((data){
      Map dataMap = json.decode(data); // para usar los métodos del objeto json se debe importar dart:convert
      
      opciones = dataMap['rutas'];
      print(dataMap);
   });
 }*/

Future<List<dynamic>> cargarData() async{

  final resp = await rootBundle.loadString('data/menu_opts.json');
  
  Map dataMap = json.decode(resp);
  //print(dataMap['rutas']);

  opciones = dataMap['rutas'];


  return opciones;

}


}

 //Crear instancia
 final menuProvider= new _MenuProvider();

/*De esta menara, este archivo menu_provider, 
solo esta exponiendo (mostrando) la instancia creada 
(menuProvider)
*/