import 'package:connectivity/connectivity.dart';
import 'package:cron/cron.dart';
import 'package:covid19/view/activity/customer/dashboard_customer.dart';
import 'package:covid19/view/activity/customer/generate_qr_code.dart';
import 'package:covid19/view/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'lainnya_customer.dart';

void main(){
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData locationData;

  var cron = new Cron();
  cron.schedule(new Schedule.parse('*/1 * * * *'), () async {
    print('every three minutes');
  });
  cron.schedule(new Schedule.parse('2-3 * * * *'), () async {
    print('between every 2 and 3 minutes');
  });

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

    locationData = await location.getLocation();
  }

  runApp(new MaterialApp(
    title: "Tampilan Tab Bar",
    home: new HomeCustomer(),
  ));
}

class HomeCustomer extends StatefulWidget {

  @override
  _HomeCustomer createState() => _HomeCustomer();
}

class _HomeCustomer extends State<HomeCustomer> with SingleTickerProviderStateMixin {
  TabController controller;
  var colorTabDashboard = colors.blueText;
  var colorTabLainnya = colors.textColor;

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
            backgroundColor: colors.buttonBlue,
            child: Image.asset('images/scanqr.png'),
            onPressed: () {
              print("tapped on floating");
              //Navigator.of(context).pushReplacementNamed('/generateQrCode');
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenerateQrCode())
              );
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
                    new DashboardCustomer(),
                    new LainnyaCustomer(),
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