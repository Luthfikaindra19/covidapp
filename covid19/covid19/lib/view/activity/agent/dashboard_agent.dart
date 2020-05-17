import 'package:connectivity/connectivity.dart';
import 'package:covid19/view/activity/agent/daftar_status.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:toast/toast.dart';

class DashboardAgent extends StatefulWidget{

  static var jumlahTest="10";
  static var jumlahPositif="5";
  static var jumlahNegatif="10";
  static var trendPositif=20;
  static var trendPositifCek=2;
  static var trendNegatif=1;
  static var trendNegatifCek=2;

  @override
  _DashboardAgent createState() => _DashboardAgent();
}

class _DashboardAgent extends State<DashboardAgent>{
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

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
                      top: 90,
                      left: 15,
                      child: Text("Selamat datang kembali,", style: TextStyle(color: Colors.white),),
                    ),
                    /*Positioned(
                      top: 110,
                      left: 15,
                      child: Text("Budi Gunawan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
                    ),
                    Positioned(
                      top: 135,
                      left: 15,
                      child: Text("Nomor Agent : 123456", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                    ),*/
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    height: 130,
                    width : double.infinity,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 25,
                          left: 25,
                          child: Text(
                              "Jumlah Test",
                            style: TextStyle(color: colors.textColor, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Positioned(
                          top: 55,
                          left: 25,
                          child: Text(
                            DashboardAgent.jumlahTest!=null? DashboardAgent.jumlahTest.toString() : "-",
                            style: TextStyle(color: colors.buttonText, fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          right: 25,
                          child: GestureDetector(
                            child: Row(
                              children: <Widget>[
                                Text("Lihat Semua", style: TextStyle(color: colors.blueText, fontWeight: FontWeight.w600),),
                                Icon(Icons.keyboard_arrow_right, color: colors.blueText,)
                              ],
                            ),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DaftarStatus())
                              );
                            },
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Row(
                  children: <Widget>[
                    Card(
                      child: SizedBox(
                        height: 115,
                        width : (media.width/2)-30,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 25,
                              left: 25,
                              child: Text(
                                "Positif",
                                style: TextStyle(color: colors.textColor, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              top: 55,
                              left: 25,
                              child: Text(
                                DashboardAgent.jumlahPositif!=null? DashboardAgent.jumlahPositif.toString() : "-",
                                style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              top: 55,
                              right: 25,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(DashboardAgent.trendPositifCek.toDouble()<0? "images/down.png" : "images/up.png"),
                                  Text(
                                    DashboardAgent.trendPositif!=null? DashboardAgent.trendPositif.toString() : "-",
                                    style: TextStyle(color: colors.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      child: SizedBox(
                        height: 115,
                        width : (media.width/2)-30,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 25,
                              left: 25,
                              child: Text(
                                "Negatif",
                                style: TextStyle(color: colors.textColor, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              top: 55,
                              left: 25,
                              child: Text(
                                DashboardAgent.jumlahNegatif!=null? DashboardAgent.jumlahNegatif.toString() : "-",
                                style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              top: 55,
                              right: 25,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(DashboardAgent.trendNegatifCek.toDouble()<0? "images/down.png" : "images/up.png"),
                                  Text(
                                    DashboardAgent.trendNegatif!=null? DashboardAgent.trendNegatif.toString() : "-",
                                    style: TextStyle(color: colors.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Card(
                  child: SizedBox(
                    height: 95,
                      width: 400,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Image.asset('images/peep.png')
                          ),
                          Positioned(
                            top: 20,
                            left: 100,
                            child: Text(
                              "Informasi tentang virus Covid-19",
                              style: TextStyle(
                                color: colors.buttonText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 100,
                            child: Text(
                              "Temukan informasi lengkap tentang virus Covid-19",
                              style: TextStyle(
                                color: colors.textColor,
                                fontSize: 11
                              ),
                            ),
                          ),
                          Positioned(
                              top: 55,
                              left: 100,
                              child: GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Text("Selengkapnya", style: TextStyle(color: colors.blueText, fontWeight: FontWeight.w600),),
                                    Icon(Icons.keyboard_arrow_right, color: colors.blueText,)
                                  ],
                                ),
                                onTap: (){

                                },
                              )
                          )
                        ],
                      )
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );

  }
}