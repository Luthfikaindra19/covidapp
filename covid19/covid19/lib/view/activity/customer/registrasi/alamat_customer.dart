import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera_camera/camera_camera.dart';
import 'package:covid19/view/activity/customer/registrasi/registrasi_customer.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

ProgressDialog pr;

class AlamatCustomer extends StatefulWidget {

  @override
  _AlamatCustomer createState() => _AlamatCustomer();

}

class _AlamatCustomer extends State<AlamatCustomer>{
  static TextEditingController editingController = TextEditingController();
  TextEditingController _controllerName = TextEditingController();

  File val;
  String encoded;
  Uint8List image;

  ImageProvider ktpProvider=null;
  ImageProvider selfieProvider=null;

  var colorName = colors.textColor;
  var colorAlamat = colors.textColor;
  var colorKodePos = colors.textColor;
  var colorProvinsi = colors.textColor;
  var colorKota = colors.textColor;
  var colorKecamatan = colors.textColor;
  var colorKelurahan = colors.textColor;
  var colorKtp = colors.textColor;
  var colorRtRw = colors.textColor;

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

    void _showDialogModal(String button, String msg){
      showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))
          ),
          builder: (builder) {
            return new SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Image.asset("images/newmessage.png", height: 150, width: 150,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(msg, style: TextStyle(fontSize: 18, color: colors.textColor, fontFamily: 'Lato'), textAlign: TextAlign.center,),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if(button=="ke halaman login"){
                          Navigator.popUntil(context, ModalRoute.withName('/loginCustomer'));
                        }else{
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        button.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato'
                        ),
                      ),
                      color: colors.blueText,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          });
    }

    void _confirmModal() {
      showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))
          ),
          builder: (builder) {
            return Container(
                height: 150,
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
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                              width: media.width <= 360 ? 100 : media.width <= 452 ? 100 : 170,
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
                              width: media.width <= 360 ? 80 : media.width <= 452 ? 100 : 170,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _showDialogModal("ke halaman login", "Silahkan cek email Anda");
                                },
                                child: Text(
                                  "ya".toUpperCase(),
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
              child: Form(
                key:RegistrasiCustomer.formAlamatCustomer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text('Silahkan lengkapi data berikut'.toUpperCase(), style: TextStyle(color: colors.textColor,fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text('Nama Lengkap', style: TextStyle(color: colors.blueText),),
                        )
                      ],
                    ),
                    _buildTextFieldName(),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text('Alamat', style: TextStyle(color: colors.blueText),),
                        )
                      ],
                    ),
                    _buildTextFieldAlamat(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text('Kode Pos', style: TextStyle(color: colors.blueText),),
                        )
                      ],
                    ),
                    _buildTextFieldKodePos(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text('Foto Selfie', style: TextStyle(color: colors.blueText),),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                            width: media.width-40,
                            child: Column(
                              children: <Widget>[
                                Card(
                                  margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                                  child: Container(
                                    height: 100,
                                    width: media.width-40,
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: GestureDetector(
                                      onTap: () async {
                                        val = await showDialog(
                                            context: context,
                                            builder: (context) => Camera(
                                              mode: CameraMode.normal,

                                              orientationEnablePhoto: CameraOrientation.all,
                                            )
                                        );

                                        Navigator.popUntil(context, ModalRoute.withName('/registrasiCustomer'));
                                      },
                                      child: Image(
                                        image : selfieProvider == null ? AssetImage('images/foto.png') : selfieProvider,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        onPressed: () {
                          final form = RegistrasiCustomer.formAlamatCustomer.currentState;
                          form.save();
                          _confirmModal();
                        },
                        child: Text(
                          "kirim".toUpperCase(),
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
              )
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldName() {
    return TextFormField(
      controller: _controllerName,
      maxLength: 100,
      onSaved: (value) {
      },
      onTap: (){
        setState(() {
          colorName = colors.blueText;
          colorAlamat = colors.textColor;
          colorKodePos = colors.textColor;
          colorProvinsi = colors.textColor;
          colorKota = colors.textColor;
          colorKecamatan = colors.textColor;
          colorKelurahan = colors.textColor;
          colorKtp = colors.textColor;
          colorRtRw = colors.textColor;
        });
      },
      keyboardType: TextInputType.text,
      obscureText: false,
      cursorColor: colors.blueText,
      decoration: InputDecoration(
        hintText: 'masukkan nama lengkap anda',
          hintStyle: TextStyle(color: colorName)
      ),
    );
  }

  Widget _buildTextFieldAlamat() {
    return TextFormField(
      obscureText: false,
      onSaved: (value) {
      },
      onTap: (){
        setState(() {
          colorName = colors.textColor;
          colorAlamat = colors.blueText;
          colorKodePos = colors.textColor;
          colorProvinsi = colors.textColor;
          colorKota = colors.textColor;
          colorKecamatan = colors.textColor;
          colorKelurahan = colors.textColor;
          colorKtp = colors.textColor;
          colorRtRw = colors.textColor;
        });
      },
      cursorColor: colors.blueText,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'masukkan alamat anda',
          hintStyle: TextStyle(color: colorAlamat)
      ),
    );
  }

  Widget _buildTextFieldKodePos() {
    return TextFormField(
      obscureText: false,
      onSaved: (value) {
      },
      onTap: (){
        setState(() {
          colorName = colors.textColor;
          colorAlamat = colors.textColor;
          colorKodePos = colors.blueText;
          colorProvinsi = colors.textColor;
          colorKota = colors.textColor;
          colorKecamatan = colors.textColor;
          colorKelurahan = colors.textColor;
          colorKtp = colors.textColor;
          colorRtRw = colors.textColor;
        });
      },
      cursorColor: colors.blueText,
      decoration: InputDecoration(
          hintText: 'masukkan kode pos rumah anda',
          hintStyle: TextStyle(color: colorKodePos)
      ),
    );
  }

}