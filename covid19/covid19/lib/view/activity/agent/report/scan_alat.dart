import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:covid19/view/activity/agent/scan_hasil_rapid_test.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

ProgressDialog pr;

class ScanALat extends StatefulWidget {

  @override
  _ScanALat createState() => _ScanALat();

}

class _ScanALat extends State<ScanALat>{

  ScanResult scanResult;

  final _flashOnController = TextEditingController(text: "Flash on");
  final _flashOffController = TextEditingController(text: "Flash off");
  final _cancelController = TextEditingController(text: "Cancel");

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

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

    Future scan() async {
      try {
        var options = ScanOptions(
          strings: {
            "cancel": _cancelController.text,
            "flash_on": _flashOnController.text,
            "flash_off": _flashOffController.text,
          },
          restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        );

        var result = await BarcodeScanner.scan(options: options);

        setState(() => scanResult = result);
      } on PlatformException catch (e) {
        var result = ScanResult(
          type: ResultType.Error,
          format: BarcodeFormat.unknown,
        );

        if (e.code == BarcodeScanner.cameraAccessDenied) {
          setState(() {
            result.rawContent = 'The user did not grant the camera permission!';
          });
        } else {
          result.rawContent = 'Unknown error: $e';
        }
        setState(() {
          scanResult = result;
        });
      }
    }

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
                      Text('Berhasil Scan Alat Rapid Test', style: TextStyle(color: colors.buttonText,fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("images/sukses.png"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text('Kode Alat Rapid Test', style: TextStyle(color: colors.textColor),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("123613321", style: TextStyle(color: colors.buttonText,fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text("Available", style: TextStyle(color: Colors.red),),
                      )
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
                        scan().then((response){
                          print("ini hasilnya = "+scanResult.rawContent);
                          ScanHasilRapidTest.tabIndex=ScanHasilRapidTest.tabIndex+1;
                          ScanHasilRapidTest.controller.index=ScanHasilRapidTest.tabIndex;
                          ScanHasilRapidTest.controller.animateTo((ScanHasilRapidTest.controller.index));

                        });
                      },
                      child: Text(
                        "Scan code qr karyawan".toUpperCase(),
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