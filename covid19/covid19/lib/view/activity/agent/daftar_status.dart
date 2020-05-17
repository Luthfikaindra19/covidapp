import 'package:covid19/view/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class DaftarStatus extends StatefulWidget{

  @override
  _DaftarStatus createState() => _DaftarStatus();
}

class _DaftarStatus extends State<DaftarStatus>{
  bool isLoading;
  int page;
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Text("Riwayat Hasil Test", style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600),)
            ],
          ),
          backgroundColor: colors.bgThemeWhite,
          leading: Row(
            children: <Widget>[
              IconButton(
                icon: Image.asset("images/back.png"),
                onPressed:() {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          bottom: PreferredSize(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: colors.bgThemeWhite,
                      width: 1,
                    ),
                  ),
                ),
                child: ListTile(
                  title: Text(DateFormat('EEE, d MMM yyyy').format(DateTime.now()), style: TextStyle(color: colors.textColor),),
                ),
              ),
              preferredSize: Size.fromHeight(50.0)
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
            children: <Widget>[
              ListView.builder(
                controller: _controller,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: SizedBox(
                        height: 220,
                        width : double.infinity,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 25,
                              left: 25,
                              child: Text(
                                "Kode Alat Rapid Test",
                                style: TextStyle(color: colors.textColor, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              top: 48,
                              left: 25,
                              child: Text(
                                "199923913",
                                style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              top: 85,
                              left: 25,
                              child: Text(
                                "ID",
                                style: TextStyle(color: colors.textColor, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              top: 108,
                              left: 25,
                              child: Text(
                                "12345",
                                style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              top: 145,
                              left: 25,
                              child: Text(
                                "Nama",
                                style: TextStyle(color: colors.textColor, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              top: 168,
                              left: 25,
                              child: Text(
                                "Mubaroq Iqbal",
                                style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              top: 158,
                              left: 220,
                              child: Container(
                                  height: 30,
                                  width: 100,
                                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: Center(
                                    child: Text("NEGATIF", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),//Text(listHistory[index].statusKesehatan??"NEGATIF", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                                  ),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ]
        )
    );

  }
}