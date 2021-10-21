import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  //const CardPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cards'),
                      ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(height: 30.0,),//Para dejar un espacio
            _cardTipo2(),
          ],
        ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_album,color: Colors.blue,),
              title: Text('Soy el titulo de esta tarjeta'),
              subtitle: Text('poner una cadena muy larga aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                          onPressed: (){}, 
                          child: Text('Cancelar')
                          ),
                TextButton(
                           onPressed: (){}, 
                           child: Text('OK')
                          ),
              ],
            )
        ],
      ),
    );

  }

  Widget _cardTipo2() {
    //return Card(
     final card= Container(//Card(
      //clipBehavior: Clip.antiAlias, //no funciona
        child: Column(
          children: <Widget>[
           FadeInImage(
             image: NetworkImage('https://scontent-dfw5-2.xx.fbcdn.net/v/t31.18172-8/17218710_1253231141424786_5871703485702604821_o.jpg?_nc_cat=106&ccb=1-5&_nc_sid=9267fe&_nc_eui2=AeGmHNK615xbkHY45f6aCKHKLPSp0JuGHRos9KnQm4YdGkgvW_U8aWMC7-jrlH7XaVA-wx5OZYBF69fAvBuPPCaW&_nc_ohc=IaCqJnDQRz4AX_w7VUx&_nc_ht=scontent-dfw5-2.xx&oh=6bbe0d1bce725dc1694f72e7e79ee407&oe=61946A65'),
             placeholder: AssetImage('assets/jar-loading.gif'),
             fadeInDuration: Duration(milliseconds: 200),
             height: 250,
             fit: BoxFit.cover,
           ),
            /*Image(image: NetworkImage('https://scontent-dfw5-2.xx.fbcdn.net/v/t31.18172-8/17218710_1253231141424786_5871703485702604821_o.jpg?_nc_cat=106&ccb=1-5&_nc_sid=9267fe&_nc_eui2=AeGmHNK615xbkHY45f6aCKHKLPSp0JuGHRos9KnQm4YdGkgvW_U8aWMC7-jrlH7XaVA-wx5OZYBF69fAvBuPPCaW&_nc_ohc=IaCqJnDQRz4AX_w7VUx&_nc_ht=scontent-dfw5-2.xx&oh=6bbe0d1bce725dc1694f72e7e79ee407&oe=61946A65'),
            ),*/
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Tenia que poner un texto')),
          ],
        ),
    );

    return Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(30.0),
         color: Colors.white,
         boxShadow: <BoxShadow>[
           BoxShadow(
             color: Colors.black26,
             blurRadius: 10.0,
             spreadRadius: 2.0,//que tanto se debe extender
             offset: Offset(2.0,10.0),//es la posición o dirección de la sombra
           ),
         ]
         //color: Colors.red,
       ), 
       child: ClipRRect(
         borderRadius: BorderRadius.circular(30.0),
         child: card,
       ),
    );
  }
}