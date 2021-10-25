
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:componentes/src/pages/home_temp.dart';

//import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
//import 'package:componentes/src/pages/avatar_page.dart';

import 'package:componentes/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],

      title: 'Componentes App',
      //home: HomePageTemp()
      //home: HomePage()
      //Configurar navegación por nombre,
      //Se puso el mismo nombre que en el archivo json
      initialRoute:'/',
      routes: getApplicationRoutes(),
      /*
       * Se peuden generar a este nivel si son pocas paginas, pero si son muchas es mejor manejarlo en otro archivo (buena practica)
      <String,WidgetBuilder>{
        '/'      : (BuildContext context)=>HomePage(),
        'alert'  : (BuildContext context)=>AlertPage(),
        'avatar' : (BuildContext context)=>AvatarPage(),
      },*/
      //Generar una ruta dinámica
      onGenerateRoute: (RouteSettings setting){
        return MaterialPageRoute(builder: (context)=>AlertPage()
        );
      },
    );
  }
}