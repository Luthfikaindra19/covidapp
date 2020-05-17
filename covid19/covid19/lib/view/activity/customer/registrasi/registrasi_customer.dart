import 'package:covid19/view/activity/customer/registrasi/alamat_customer.dart';
import 'package:covid19/view/activity/customer/registrasi/data_diri_customer.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: "Tampilan Tab Bar",
    home: new RegistrasiCustomer(),
  ));
}

class RegistrasiCustomer extends StatefulWidget {
  static final formKeyDataDiriCustomer = GlobalKey<FormState>();
  static final formAlamatCustomer = GlobalKey<FormState>();
  static TabController controller;
  static int tabIndex=0;

  @override
  _RegistrasiCustomer createState() => _RegistrasiCustomer();
}

class _RegistrasiCustomer extends State<RegistrasiCustomer> with SingleTickerProviderStateMixin {

  @override

  void initState(){
    RegistrasiCustomer.controller = new TabController(vsync: this, length: 2);
    RegistrasiCustomer.tabIndex=0;
    super.initState();
  }

  @override
  void dispose(){
    RegistrasiCustomer.controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //create appBar
      appBar: new AppBar(
        title: Row(
          children: <Widget>[
            Text("Registrasi", style: TextStyle(color: colors.buttonText, fontWeight: FontWeight.w600),)
          ],
        ),
        automaticallyImplyLeading: true,
        backgroundColor: colors.bgThemeWhite,
        leading: Row(
          children: <Widget>[
            IconButton(
              icon: Image.asset("images/back.png"),
              onPressed:() {
                if(RegistrasiCustomer.tabIndex!=0){
                  RegistrasiCustomer.tabIndex = RegistrasiCustomer.tabIndex-1;
                  RegistrasiCustomer.controller.index = RegistrasiCustomer.tabIndex;
                  RegistrasiCustomer.controller.animateTo((RegistrasiCustomer.controller.index));
                }else{
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
        bottom: new TabBar(
          onTap: ((value){
            setState(() {
              RegistrasiCustomer.controller.index = RegistrasiCustomer.tabIndex;
            });
          }),
          controller: RegistrasiCustomer.controller,
          labelColor: colors.textColor,
          //source code lanjutan
          tabs: <Widget>[
            new Tab(text: "1",),
            new Tab(text: "2",),
          ],
        ),
      ),
      backgroundColor: colors.bgThemeWhite,
      body: new TabBarView(
        //controller untuk tab bar
        physics: NeverScrollableScrollPhysics(),
        controller: RegistrasiCustomer.controller,
        children: <Widget>[
          //kemudian panggil halaman sesuai tab yang sudah dibuat
          new DataDiriCustomer(),
          new AlamatCustomer(),
        ],
      ),
    );
  }
}