import 'dart:convert';
import 'package:covid19/view/activity/agent/report/berhasil_input.dart';
import 'package:covid19/view/activity/customer/registrasi/registrasi_customer.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:location/location.dart';
import 'package:toast/toast.dart';

ProgressDialog pr;

class InputHasil extends StatefulWidget {

  @override
  _InputHasil createState() => _InputHasil();

}

class _InputHasil extends State<InputHasil>{
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  Color colorPositif= Colors.white;
  Color colorNegatif = Colors.white;
  Color colorTextPositif= Colors.red;
  Color colorTextNegatif = Colors.green;

  @override
  void initState() {

    super.initState();
  }

  Future<void> locationCheck() async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
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

    void _confirmModal() {
      showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))
          ),
          builder: (builder) {
            return Container(
              height: media.height/2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Konfirmasi Data', style: TextStyle(color: colors.buttonText,fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                          Text("13212313",style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600)),
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
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                            width: 170,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "tidak".toUpperCase(),
                                style: TextStyle(
                                    color: colors.textColor,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: 170,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => BerhasilInput())
                                );
                              },
                              child: Text(
                                "konfirmasi".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              color: colors.blueText,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            );
          });
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
                    children: <Widget>[
                      Container(
                        child: Text('Kode Alat Rapid Test', style: TextStyle(color: colors.textColor),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text("328176", style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text('ID', style: TextStyle(color: colors.textColor),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text("12345", style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text('Nama', style: TextStyle(color: colors.textColor),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text("Mubaroq Iqbal", style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width : 160,
                        height: 45,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          color: colorPositif,
                          textColor: colorTextPositif,
                          onPressed: () {
                            setState(() {
                              colorPositif=Colors.red;
                              colorNegatif=Colors.white;
                              colorTextNegatif=Colors.green;
                              colorTextPositif=Colors.white;
                            });
                          },
                          child: Text(
                            "Positif".toUpperCase(),
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width : 160,
                        height: 45,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.green),
                          ),
                          color: colorNegatif,
                          textColor: colorTextNegatif,
                          onPressed: () {
                            print("tapped on top up button");
                            setState(() {
                              colorPositif=Colors.white;
                              colorNegatif=Colors.green;
                              colorTextNegatif=Colors.white;
                              colorTextPositif=Colors.red;

                            });
                          },
                          child: Text(
                            "Negatif".toUpperCase(),
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      onPressed: () {
                        _confirmModal();
                      },
                      child: Text(
                        "KIRIM".toUpperCase(),
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