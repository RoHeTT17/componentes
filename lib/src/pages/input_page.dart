import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


 String _nombre="",_email="",_fecha="";

 TextEditingController _inputDateController = new TextEditingController();

 List<String> _poderes = ['Volar','Rayos X',' Super Aliente','Super Fuerza'];
 String _opcSelect="Volar"; 

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
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
          Divider(),
        
        ],
        
      ),  
    );
  }

  Widget _crearInputs() {
    return TextField(
      autofocus: false,
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

 Widget _crearFecha(BuildContext context){
   return  TextField(
    enableInteractiveSelection: false,
    controller: _inputDateController,
    decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  hintText: 'Fecha de nacimiento',
                  labelText: 'Fecha de nacimiento',
                  suffixIcon: Icon(Icons.calendar_today_sharp),
                  icon: Icon(Icons.calendar_view_day)
                ),
    onTap:(){
      //Quitar el Focus (no permite escribir sobre el textfield)
      FocusScope.of(context).requestFocus(new FocusNode());
      _selectDate(context);
     } ,
 );
}

  _selectDate(BuildContext context) async{

   DateTime? picked = await showDatePicker(
    context: context,
    initialDate: new DateTime.now(),
    firstDate: new DateTime(2018),
    lastDate: new DateTime(2025),
    locale: Locale("es","ES")
  );  

  if(picked!=null){
    setState(() {
        _fecha = picked.toString();
        _inputDateController.text = _fecha;
    });
  }

  }

  List<DropdownMenuItem<String>> getOpcionesCombo(){
    
    List<DropdownMenuItem<String>> opciones = [];

    _poderes.forEach((item) {
        opciones.add(DropdownMenuItem(
          child: Text(item),
          value: item,
        ));
    });  

    return opciones;

  }

  Widget _crearDropDown() {

      return Row(
        children: <Widget>[
          Icon(Icons.select_all),
          SizedBox(width: 30.0,),
          Expanded(
            child: DropdownButton(
                      value: _opcSelect,
                      items: getOpcionesCombo(),
                      onChanged: (selected){
                        setState(() {
                          _opcSelect = selected.toString();
                        });
                      },
            ),
          )
        ],

      );

  }
}