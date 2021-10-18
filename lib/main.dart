
import 'package:flutter/material.dart';
//import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      //home: HomePageTemp()
      //home: HomePage()
      //Configurar navegación por nombre,
      //Se puso el mismo nombre que en el archivo json
      initialRoute:'/',
      routes: <String,WidgetBuilder>{
        '/'      : (BuildContext context)=>HomePage(),
        'alert'  : (BuildContext context)=>AlertPage(),
        'avatar' : (BuildContext context)=>AvatarPage(),
      },

    );
  }
}