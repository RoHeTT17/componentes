import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider=100.0;
  bool _isBloqued=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Slider"),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _crearSlider(),
              _checkBox(),
              _crearSwitch(),
             Expanded(child: _crearImagen())
              ],
            
          ),
        ),
    );
  }

 Widget _crearSlider() {
   return Slider(
     activeColor: Colors.indigo,
     label: "Tamaño",
     //divisions: 20,
     min: 10.0,
     max: 400.0,
     value: _valorSlider, 
     onChanged: (_isBloqued) ? null :(valor){
       setState(() {
         _valorSlider=valor;
       });
     }
     );
 }
  
  Widget _checkBox() {
    return 
    /*Checkbox(
      
      value: _isBloqued,
      onChanged: (isCheck){
        setState(() {
           _isBloqued=isCheck as bool; //En lugar del as bool puede ir el simbolo !
        });
      }
      );*/

    CheckboxListTile(
      title: Text("Bloquear sider"),
      value: _isBloqued,
      onChanged: (isCheck){
        setState(() {
           _isBloqued=isCheck as bool; //En lugar del as bool puede ir el simbolo !
        });
      }
    );
  }
  
  Widget _crearSwitch() {
      return SwitchListTile(
      title: Text("Bloquear sider"),
      value: _isBloqued,
      onChanged: (isCheck){
        setState(() {
           _isBloqued=isCheck as bool; //En lugar del as bool puede ir el simbolo !
        });
      }
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage("https://static.vecteezy.com/system/resources/previews/000/042/169/original/mushroom-vector-power.jpg"),
      width: _valorSlider,
      fit: BoxFit.contain,
      );
  }



 
}