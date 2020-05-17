import 'dart:convert';
import 'dart:typed_data';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:connectivity/connectivity.dart';
import 'package:covid19/view/activity/agent/dashboard_agent.dart';
import 'package:covid19/view/activity/agent/scan_hasil_rapid_test.dart';
import 'package:covid19/view/activity/agent/scan_status_kesehatan.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:toast/toast.dart';
import 'lainnya_agent.dart';

void main(){
  runApp(new MaterialApp(
    title: "Tampilan Tab Bar",
    home: new HomeAgent(),
  ));
}

class HomeAgent extends StatefulWidget {

  @override
  _HomeAgent createState() => _HomeAgent();
}

class _HomeAgent extends State<HomeAgent> with SingleTickerProviderStateMixin {
  TabController controller;
  var colorTabDashboard = colors.blueText;
  var colorTabLainnya = colors.textColor;

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


  int idx=0;

  @override
  void initState(){
    controller = new TabController(vsync: this, length: 2);

    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
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

    void _scanModal(){
      showBarModalBottomSheet(
          context: context,
          enableDrag: true,
          isDismissible: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
          ),
          builder: (context, scrollController) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      onPressed: () {
                        scan().then((response){
                          print("ini hasilnya = "+scanResult.rawContent);
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ScanHasilRapidTest())
                          );
                        });
                      },
                      child: Text(
                        "Scan Hasil Rapid Test".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      color: colors.buttonBlue,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      onPressed: () {
                        scan().then((response){
                          print("ini hasilnya = "+scanResult.rawContent);
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ScanStatusKesehatan())
                          );
                        });
                      },
                      child: Text(
                        "scan status kesehatan".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      color: colors.buttonBlue,
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return new WillPopScope(
      onWillPop: _onWillHome,
      child: Scaffold(
        //create appBar
        backgroundColor: colors.bgThemeWhite,
        floatingActionButton: Container(
          height: media.width <= 360 ? 75 : media.width <= 452 ? 75 : 90,
          width: media.width <= 360 ? 75 : media.width <= 452 ? 75 : 90,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(Radius.circular(45)),
            boxShadow: [
              BoxShadow(
                  color: colors.textColor,
                  blurRadius: 2.0, // has the effect of softening the shadow
                  spreadRadius: 0.05, //
                  offset: Offset(0,4)
              )
            ],
          ),
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: colors.bgTheme,
            child: Image.asset('images/scan.png'),
            onPressed: () {
              print("tapped on floating");
              _scanModal();
              //Toast.show("Fitur ini masih dalam tahap pengembangan", context, duration: 3, gravity:  Toast.BOTTOM);
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(Radius.circular(45)),
            boxShadow: [
              BoxShadow(
                  color: colors.textColor,
                  blurRadius: 2.0, // has the effect of softening the shadow
                  spreadRadius: 0.05, //
                  offset: Offset(0,4),
              )
            ],
          ),
          child: BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            child: TabBar(
              controller: controller,
              labelColor: Colors.white,
              unselectedLabelColor: colors.textColor,
              indicatorColor: Colors.transparent,
              onTap: (index){
                setState(() {
                  idx = index;
                  if(index==0){
                    colorTabLainnya = colors.textColor;
                    colorTabDashboard = colors.blueText;
                  }else if(index==1){
                    colorTabLainnya = colors.blueText;
                    colorTabDashboard = colors.textColor;
                  }
                });
              },
              tabs: <Widget>[
                new Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.transparent
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Image.asset(idx==0 ? 'images/beranda.png' : 'images/beranda-grey.png'),
                      ),
                    ),
                  ),
                ),
                new Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.transparent
                    ),
                    child: Center(
                      child: IconButton(
                        iconSize: 70,
                        icon: Image.asset(idx==1 ? 'images/lainnya.png' : 'images/lainnya-grey.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: media.height,
                child: TabBarView(
                  //controller untuk tab bar
                  controller: controller,
                  children: <Widget>[
                    //new sesamaiDanai.SesamaDanai(),
                    new DashboardAgent(),
                    new LainnyaAgent(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}