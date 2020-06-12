import 'package:flutter/material.dart';
import 'package:imageBoard/homescreen.dart';


void main() {
  runApp(ImageBoard());
}


class ImageBoard extends StatefulWidget {
  ImageBoard({Key key}) : super(key: key);

  @override
  _ImageBoardState createState() => _ImageBoardState();
}

class _ImageBoardState extends State<ImageBoard> {
  bool dark = false;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dark == false ? ThemeData.light() : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(switchTheme: this.switchTheme,theme:dark),
    );
  }

  void switchTheme(bool){
    setState(() {
      dark = !dark;
    });
  }
}