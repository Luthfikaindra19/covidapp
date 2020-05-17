import 'dart:convert';
import 'package:covid19/view/activity/customer/registrasi/registrasi_customer.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

ProgressDialog pr;

class DataDiriCustomer extends StatefulWidget {

  @override
  _DataDiriCustomer createState() => _DataDiriCustomer();

}

class _DataDiriCustomer extends State<DataDiriCustomer>{
  static TextEditingController editingController = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();

  var email;
  var phone;
  var password;

  var colorEmail = colors.textColor;
  var colorHP = colors.textColor;
  var colorPassword = colors.textColor;
  var colorConfirmPassword = colors.textColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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
              child: Form(
                key:RegistrasiCustomer.formKeyDataDiriCustomer,
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
                          child: Text('Email', style: TextStyle(color: colors.blueText),),
                        )
                      ],
                    ),
                    _buildTextFieldEmail(),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text('Password', style: TextStyle(color: colors.blueText),),
                        )
                      ],
                    ),
                    _buildTextFieldPassword(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text('Konfirmasi Password', style: TextStyle(color: colors.blueText),),
                        )
                      ],
                    ),
                    _buildTextFieldConfirmPassword(),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Password harus terdiri dari:', style: TextStyle(color: colors.textColor,fontSize: 12, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 4,
                    ),
                    Text('- sedikitnya 8 karakter', style: TextStyle(color: colors.textColor,fontSize: 12, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 4,
                    ),
                    Text('- sedikitnya 1 huruf besar', style: TextStyle(color: colors.textColor, fontSize: 12, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        onPressed: () {
                          final form = RegistrasiCustomer.formKeyDataDiriCustomer.currentState;
                          form.save();

                            RegistrasiCustomer.tabIndex=RegistrasiCustomer.tabIndex+1;
                            RegistrasiCustomer.controller.index=RegistrasiCustomer.tabIndex;
                            RegistrasiCustomer.controller.animateTo((RegistrasiCustomer.controller.index));

                        },
                        child: Text(
                          "berikutnya".toUpperCase(),
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

  Widget _buildTextFieldEmail() {
    return TextFormField(
      controller: _controllerEmail,
      maxLength: 100,
      onSaved: (value) {
      },
      onTap: (){
        setState(() {
          colorEmail = colors.blueText;
          colorHP = colors.textColor;
          colorPassword = colors.textColor;
          colorConfirmPassword = colors.textColor;
        });
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      cursorColor: colors.blueText,
      decoration: InputDecoration(
        hintText: 'masukkan email anda',
      ),
    );
  }

  Widget _buildTextFieldPassword() {
    return TextFormField(
      obscureText: true,
      onSaved: (value) {
      },
      onTap: (){
        setState(() {
          colorEmail = colors.textColor;
          colorHP = colors.textColor;
          colorPassword = colors.blueText;
          colorConfirmPassword = colors.textColor;
        });
      },
      cursorColor: colors.blueText,
      decoration: InputDecoration(
          hintText: 'masukkan password anda',
          hintStyle: TextStyle(color: colorPassword)
      ),
    );
  }

  Widget _buildTextFieldConfirmPassword() {
    return TextFormField(
      obscureText: true,
      onSaved: (value) {
      },
      onTap: (){
        setState(() {
          colorEmail = colors.textColor;
          colorHP = colors.textColor;
          colorPassword = colors.textColor;
          colorConfirmPassword = colors.blueText;
        });
      },
      cursorColor: colors.blueText,
      decoration: InputDecoration(
          hintText: 'masukkan ulang password anda',
          hintStyle: TextStyle(color: colorConfirmPassword)
      ),
    );
  }
}