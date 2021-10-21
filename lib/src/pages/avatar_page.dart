import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://static.wikia.nocookie.net/zelda/images/2/26/Link_Artwork_LAR.png/revision/latest?cb=20191015020845&path-prefix=es'),
              radius: 20.0,

            ),
          ), 

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
                child: Text('RH'),
                backgroundColor: Colors.deepPurple,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://www.teahub.io/photos/full/89-896352_majora-s-mask-desktop-wallpaper-link-data-src.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          //fadeInDuration: Duration(microseconds: 200), 
          fadeInDuration: Duration(milliseconds: 200),
          ),
      ),
    );
  }
}