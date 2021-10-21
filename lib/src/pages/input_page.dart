import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  String _nombre="",_email="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
        ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInputs(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearPersona(),
        ],
        
      ),  
    );
  }

  Widget _crearInputs() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Nombre completo',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (e){
        setState(() {
             _nombre=e;
        });
       // print(_nombre);
      },

    );
  }

 Widget _crearPersona() {

   return ListTile(
     title: Text('$_nombre'),
     subtitle: Text('Correo $_email'),

   );

 }

 Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        //counter: Text('Letras ${_nombre.length}'),
        hintText: 'Correo eelctronico',
        labelText: 'Email',
        helperText: 'recuerda el @',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (correo)=>setState(() {
             _email=correo;
        }),
    );
 }

 Widget _crearPassword() {
    return TextField(
      obscureText: true,
      //keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        //counter: Text('Letras ${_nombre.length}'),
        hintText: 'Contraseña',
        labelText: 'Password',
        helperText: 'que sea segura',
        suffixIcon: Icon(Icons.password_outlined),
        icon: Icon(Icons.password)
      ),
     /* onChanged: (correo)=>setState(() {
             _email=correo;
        }),*/

    );
 }

}