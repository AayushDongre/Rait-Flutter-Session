import 'package:flutter/material.dart';
import 'package:imageBoard/gridView.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.switchTheme, this.theme}) : super(key: key);
  Function switchTheme;
  bool theme;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: <Widget>[
          Switch(value: widget.theme, onChanged: widget.switchTheme)
        ],
        title: Text(
          'Gallery',
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: ImageGrid(),
    );
  }
}
