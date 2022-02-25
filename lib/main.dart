import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Authenication/PasscodeScreen.dart';
import 'package:untitled/Constants/Colors.dart';
import 'package:untitled/SittingPlane/Resturatnt.dart';
import 'package:untitled/SittingPlane/SittingPAlne.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.purple,
       textTheme: TextTheme(
         headline1: TextStyle(
           color: Colors.white
         )

      ),

       appBarTheme: AppBarTheme(
         color: Ccolors.appbarcolor,

       )
      ),
      home:Resturants(),
    );
  }
}

