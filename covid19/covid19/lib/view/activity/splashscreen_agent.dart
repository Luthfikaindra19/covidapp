import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreenAgent extends StatefulWidget{
  @override
  _SplashScreenAgent createState() => _SplashScreenAgent();
}

class _SplashScreenAgent extends State<SplashScreenAgent>{

  @override
  void initState(){
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.of(context).pushReplacementNamed('/loginAgent');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.bgTheme,
      body: new Center(
          child: Image.asset('images/splash-screen-11.png', fit: BoxFit.cover)
      ),

    );
  }
}