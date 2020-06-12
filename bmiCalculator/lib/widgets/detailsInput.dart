import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget detailsInput(BuildContext context, String text, Color backgroundColor,
    TextEditingController controller) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Column(
      children: <Widget>[
        Text(
          text,
          style:
              TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w600),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          height: 100,
          decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, offset: Offset(8, 8), blurRadius: 5)
              ],
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            // child: Text(
            //   '20',
            //   style: TextStyle(fontSize: 48, color: Colors.white),
            // ),
          ),
        )
      ],
    ),
  );
}
