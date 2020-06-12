import 'package:bmiCalculator/constants.dart';
import 'package:bmiCalculator/widgets/detailsInput.dart';
import 'package:bmiCalculator/widgets/genderButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool gender = true;
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: green,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            color: green,
            height: MediaQuery.of(context).size.height / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'your BMI is',
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  bmi.toStringAsFixed(2),
                  style: TextStyle(color: Colors.white, fontSize: 80),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32),
            child: Center(
              child: Text(
                ' Fill the details below\n to calculate your BMI',
                style: TextStyle(
                    color: Colors.grey[400], fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: genderbutton(context, 'assets/male.png',
                      selected: gender == true ? true : false),
                  onTap: () {
                    setState(() {
                      gender = true;
                    });
                  },
                ),
                GestureDetector(
                  child: genderbutton(context, 'assets/female.png',
                      selected: gender == true ? false : true),
                  onTap: () {
                    setState(() {
                      gender = false;
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Row(
              children: <Widget>[
                detailsInput(context, 'AGE', Color(0XFFF982C2), ageController),
                detailsInput(
                    context, 'HEIGHT', Color(0XFFFFDE82), heightController),
                detailsInput(
                    context, 'WEIGHT', Color(0XFF85BEFF), weightController),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  int age = int.parse(ageController.text.toString());
                  int height = int.parse(heightController.text.toString());
                  int weight = int.parse(weightController.text.toString());
                  setState(() {
                    bmi = weight / (height/100 * height/100);
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: Center(
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
