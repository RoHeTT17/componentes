import 'package:flutter/material.dart';

/*
  Esta forma de hacerlo solo es temporal, porque de momento flutter no tiene la opción de dar un icono por el nombre, se puede usar
  el paquete externo de icon_helper, pero aun no esta al 100
 */ 


final _icons=<String , IconData >{
         
        'add_alert'     : Icons.add_alert,
        'accessibility' : Icons.accessibility,
        'folder_open'   : Icons.folder_open,

};

Icon getIcon (String nombreIcon){

    return Icon(_icons[nombreIcon],color: Colors.blue,);

}