import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';

class ChooseApp extends StatefulWidget{
  @override
  _ChooseApp createState() => _ChooseApp();
}

class _ChooseApp extends State<ChooseApp>{

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.bgTheme,
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: RaisedButton(
                  elevation: 0,
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/loginAgent');
                  },
                  child: Text(
                    "Pengelola".toUpperCase(),
                    style: TextStyle(
                        color: colors.buttonText,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  color: colors.buttonWhite,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: RaisedButton(
                  elevation: 0,
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/loginCustomer');
                  },
                  child: Text(
                    "Pengguna Biasa".toUpperCase(),
                    style: TextStyle(
                        color: colors.buttonText,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  color: colors.buttonWhite,
                ),
              )
            ],
          ),
        ],
      ),

    );
  }
}