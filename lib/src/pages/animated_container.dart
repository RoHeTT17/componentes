
import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  //AnimatedContainerPAge({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
 
 double _width  = 50.0;
 double _height = 50.0;
 Color  _color  = Colors.pink;
 BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
             title: Text('Animated Container'),
           ),
           body: Center(
             child: AnimatedContainer(
               duration: Duration(seconds: 1),
               curve: Curves.easeOutQuad,
               width: _width,
               height: _height,
               decoration: BoxDecoration(
                 borderRadius: _borderRadius,
                 color: _color,

               )
             ),
           ), 
           floatingActionButton: FloatingActionButton(      
             child: Icon(Icons.play_circle),
             onPressed: (){
                _cambiarStyle();
             },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            
    );
  }

  void _cambiarStyle() {
      
      final random= Random();


      setState(() {
        _width  = random.nextInt(300).toDouble();
        _height = random.nextInt(300).toDouble();
        _color   = Color.fromRGBO(
          random.nextInt(255), 
          random.nextInt(255), 
          random.nextInt(255), 1);

          _borderRadius = new BorderRadius.circular( random.nextInt(100).toDouble());  

      });

  }
}