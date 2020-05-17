import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget{
  @override
  _GenerateQrCode createState() => _GenerateQrCode();
}

class _GenerateQrCode extends State<GenerateQrCode>{

  String code="123456";

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget _showDialog() {
      Dialog simpleDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          height: 360,
          width: 200,
          child: Stack(
            children: <Widget>[
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("QR Code", style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600, fontSize: 20),),
                        ]
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          QrImage(
                            data: code,
                            version: QrVersions.auto,
                            size: 250.0,
                          ),
                        ]
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

      showDialog(
          context: context,
          builder: (BuildContext context) => simpleDialog);
    }

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: colors.bgTheme,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: colors.bgTheme,
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                        height: 350,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("QR Code", style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600, fontSize: 20),),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: (){
                                print("tap tap");
                                _showDialog();
                              },
                              child: QrImage(
                                data: code,
                                version: QrVersions.auto,
                                size: 200.0,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Klik untuk memperbesar", style: TextStyle(color: colors.textColor, fontWeight: FontWeight.w600,),),
                          ],
                        )
                    ),
                  )
                ),
              )
            ],
          ),
        ],
      ),

    );
  }
}