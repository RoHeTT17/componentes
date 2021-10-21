import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Page'),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: (){
            Navigator.pop(context);
        },
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alert'),
          onPressed: ()=>_mostrarAlert(context),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: Colors.blue
          ),
        ),
      ),
    );
  }

  void _mostrarAlert(BuildContext contexto) {
   showDialog(
     context: contexto,
     barrierDismissible: true,//para que se cierre el alerta al dar click fuera
     builder: (contexto){

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[     
              Text('Este es el contenido de la caja alerta'),
              FlutterLogo(size: 100.0,)
            ],
          ),
          actions:<Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: ()=>Navigator.of(contexto).pop(),
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.of(contexto).pop();
              },
            ),
          ],

        );
     }
   ); 
  }
}