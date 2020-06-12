import 'package:flutter/material.dart';

Widget genderbutton(BuildContext context, String asset, {bool selected = false}) {
  return Container(
    width: MediaQuery.of(context).size.width / 3,
    height: MediaQuery.of(context).size.width / 3,
    child: Image.asset(asset),
    decoration: BoxDecoration(
        color: selected == true ? Colors.grey[350] : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(8, 8),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(16)),
  );
}
