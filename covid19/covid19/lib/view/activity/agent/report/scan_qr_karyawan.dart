import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera_camera/camera_camera.dart';
import 'package:covid19/view/activity/agent/scan_hasil_rapid_test.dart';
import 'package:covid19/view/activity/customer/registrasi/registrasi_customer.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog pr;

class ScanQrKaryawan extends StatefulWidget {

  @override
  _ScanQrKaryawan createState() => _ScanQrKaryawan();

}

class _ScanQrKaryawan extends State<ScanQrKaryawan>{

  File val;
  String encoded;
  Uint8List image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    pr = new ProgressDialog(context);
    pr.style(
        message: 'Please Waiting...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );

    return new SingleChildScrollView(
      child: Container(
        child: new Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Informasi Data karyawan', style: TextStyle(color: colors.buttonText,fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 150,
                        width: 150,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("images/user.png")
                            )
                        )
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("ID", style: TextStyle(color: colors.textColor),),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("12345", style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Nama", style: TextStyle(color: colors.textColor),),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Mubaroq Iqbal", style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600),),
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
                      ScanHasilRapidTest.tabIndex=ScanHasilRapidTest.tabIndex+1;
                      ScanHasilRapidTest.controller.index=ScanHasilRapidTest.tabIndex;
                      ScanHasilRapidTest.controller.animateTo((ScanHasilRapidTest.controller.index));
                    },
                    child: Text(
                      "Masukkan hasil rapid test".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    color: colors.blueText,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}