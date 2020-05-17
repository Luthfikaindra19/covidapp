import 'package:connectivity/connectivity.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class LainnyaCustomer extends StatefulWidget{

  @override
  _LainnyaCustomer createState() => _LainnyaCustomer();
}

class _LainnyaCustomer extends State<LainnyaCustomer>{
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new SingleChildScrollView(
      child: Container(
        child: new Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                ListTile(
                  title: Text('Login', style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600, fontSize: 24),),
                ),
                ListTile(
                  title: Text("Bantuan dan FAQ"),
                  leading: IconButton(
                    icon: Image.asset("images/bantuan.png"),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){

                  },
                ),
                ListTile(
                  title: Text("Ubah Password"),
                  leading: IconButton(
                    icon: Image.asset("images/ubah-password.png"),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){

                  },
                ),
                ListTile(
                  title: Text("Keluar"),
                  leading: IconButton(
                    icon: Image.asset("images/keluar.png"),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed('/loginCustomer');
                  },
                ),
              ],
            )
        ),
      ),
    );

  }
}