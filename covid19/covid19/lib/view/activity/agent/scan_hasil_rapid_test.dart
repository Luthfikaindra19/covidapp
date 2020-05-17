import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:covid19/view/activity/agent/dashboard_agent.dart';
import 'package:covid19/view/activity/agent/report/input_hasil.dart';
import 'package:covid19/view/activity/agent/report/scan_alat.dart';
import 'package:covid19/view/activity/agent/report/scan_qr_karyawan.dart';
import 'package:covid19/view/activity/customer/dashboard_customer.dart';
import 'package:covid19/view/activity/customer/generate_qr_code.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main(){
  runApp(new MaterialApp(
    title: "Tampilan Tab Bar",
    home: new ScanHasilRapidTest(),
  ));
}

class ScanHasilRapidTest extends StatefulWidget {
  static TabController controller;
  static int tabIndex=0;

  @override
  _ScanHasilRapidTest createState() => _ScanHasilRapidTest();
}

class _ScanHasilRapidTest extends State<ScanHasilRapidTest> with SingleTickerProviderStateMixin {
  var colorTabDashboard = colors.blueText;
  var colorTabLainnya = colors.textColor;

  int idx=0;

  @override
  void initState(){

    ScanHasilRapidTest.controller = new TabController(vsync: this, length: 3);
    ScanHasilRapidTest.tabIndex=0;
    super.initState();
  }

  @override
  void dispose(){
    ScanHasilRapidTest.controller.dispose();
    super.dispose();
  }

  Future<bool> _onWillHome() {
    setState(() {

    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return new Scaffold(
      //create appBar
      appBar: new AppBar(
        title: Row(
          children: <Widget>[
            Text(ScanHasilRapidTest.tabIndex==0 ? "Scan Alat Rapid Test" : ScanHasilRapidTest.tabIndex==1 ? "Scan Qr Code Karyawan" : "Masukkan Hasil Rapid Test", style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600),)
          ],
        ),
        automaticallyImplyLeading: true,
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
        bottom: new TabBar(
          onTap: ((value){
            setState(() {
              ScanHasilRapidTest.controller.index = ScanHasilRapidTest.tabIndex;
            });
          }),
          controller: ScanHasilRapidTest.controller,
          labelColor: colors.textColor,
          //source code lanjutan
          tabs: <Widget>[
            new Tab(text: "1",),
            new Tab(text: "2",),
            new Tab(text: "3",),
          ],
        ),
      ),
      backgroundColor: colors.bgThemeWhite,
      body: new TabBarView(
        //controller untuk tab bar
        physics: NeverScrollableScrollPhysics(),
        controller: ScanHasilRapidTest.controller,
        children: <Widget>[
          //kemudian panggil halaman sesuai tab yang sudah dibuat
          new ScanALat(),
          new ScanQrKaryawan(),
          new InputHasil(),
        ],
      ),
    );
  }
}