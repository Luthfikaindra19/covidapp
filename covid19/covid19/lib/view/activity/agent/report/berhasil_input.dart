import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../dashboard_agent.dart';


class BerhasilInput extends StatefulWidget {
  @override
  _BerhasilInput createState() => _BerhasilInput();
}

class _BerhasilInput extends State<BerhasilInput>{

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Keluar'),
        content: new Text('Apakah anda yakin ingin keluar?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Tidak'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Ya'),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context){
    var media = MediaQuery.of(context).size;

    return new WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: media.height,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left : 25.0, right: 25.0, bottom: 0.0,top: 60.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Berhasil Input Hasil Rapid Test', style: TextStyle(color: colors.buttonText,fontSize: 20, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset("images/sukses.png"),
                          Row(
                            children: <Widget>[
                              Text('Kode Alat Rapid Test',style: TextStyle(color: colors.textColor, fontSize: 14))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Text("123987",style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Text('ID',style: TextStyle(color: colors.textColor, fontSize: 14)),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Text("12345",style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Text('Nama',style: TextStyle(color: colors.textColor, fontSize: 14)),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Text("Mubaroq Iqbal",style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Text('Hasil Test',style: TextStyle(color: colors.textColor)),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  height: 30,
                                  width: 100,
                                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: Center(
                                    child: Text("NEGATIF", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                                  ),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  )
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                              onPressed: () {
                                Navigator.popUntil(context, ModalRoute.withName('/homeAgent'));
                              },
                              child: Text(
                                "Ke menu utama".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              color: colors.blueText,
                            ),
                          ),
                        ],
                      ),
                  ),
                ],
              ),
            )
        )
    );
  }
}