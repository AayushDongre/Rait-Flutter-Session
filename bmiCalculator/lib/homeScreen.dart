import 'package:bmiCalculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('BMI Calculator', style: GoogleFonts.roboto(fontSize: 32)),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.width * .4,
                color: defaultBoxColor,
              ),
              Container(
                margin: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.width * .4,
                color: defaultBoxColor,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                
                color: Color(0xFF2F3F4B),
              )
            ],
          )
        ],
      ),
    );
  }
}
