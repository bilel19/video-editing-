import 'package:flutter/material.dart';

Widget Defaultbutton({
  double width = double.infinity,
  Color backgroundcolor = Colors.blue,
  required Function? function,
  double radius = 0,
  required String text,
  bool isoppercase = true,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: () {
          function!();
        },
        child: Text(
          isoppercase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: backgroundcolor,
      ),
    );

void NavigatTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void NavigatAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);
