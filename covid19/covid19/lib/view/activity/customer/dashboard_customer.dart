import 'dart:typed_data';

import 'package:connectivity/connectivity.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:toast/toast.dart';

class DashboardCustomer extends StatefulWidget{

  @override
  _DashboardCustomer createState() => _DashboardCustomer();
}

class _DashboardCustomer extends State<DashboardCustomer>{
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  String nama="Mubaroq Iqbal";
  String status="Negatif";
  String nik="123456";

  ImageProvider profPicProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;

    return new SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                width : double.infinity,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Container(
                        color: colors.bgTheme,
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: (media.width/2)-50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 110,
                              width: 110,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: profPicProvider ?? AssetImage("images/user.png")
                                  )
                              )
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text("ID", style: TextStyle(color: colors.textColor, fontSize: 20),),
              SizedBox(
                height: 5,
              ),
              Text(nik, style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600, fontSize: 20),),
              SizedBox(
                height: 15,
              ),
              Text("Nama", style: TextStyle(color: colors.textColor, fontSize: 20),),
              SizedBox(
                height: 5,
              ),
              Text(nama, style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600, fontSize: 20),),
              SizedBox(
                height: 15,
              ),
              Text("Status Covid-19", style: TextStyle(color: colors.textColor, fontSize: 20),),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 55,
                width: 100,
                child: Center(
                  child: Text(status==null? "-" : status, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
                ),
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  )
              )
            ],
          )
        ],
      ),
    );

  }
}