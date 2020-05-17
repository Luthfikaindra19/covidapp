import 'package:covid19/view/activity/agent/login_agent_app.dart';
import 'package:covid19/view/activity/choose_app.dart';
import 'package:covid19/view/activity/splashscreen_agent.dart';
import 'package:covid19/view/activity/splashscreen_customer.dart';
import 'package:flutter/material.dart';

import 'agent/dashboard_agent.dart';
import 'agent/home_agent.dart';
import 'agent/scan_hasil_rapid_test.dart';
import 'customer/dashboard_customer.dart';
import 'customer/generate_qr_code.dart';
import 'customer/home_customer.dart';
import 'customer/login_customer_app.dart';
import 'customer/registrasi/registrasi_customer.dart';

void main() {

  runApp(
    MaterialApp(
      title: 'Splash Screen',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new ChooseApp(),
        '/splashScreenAgent': (BuildContext context) => new SplashScreenAgent(),
        '/splashScreenCustomer': (BuildContext context) => new SplashScreenCustomer(),
        '/loginAgent': (BuildContext context) => new LoginAgentApp(),
        '/loginCustomer': (BuildContext context) => new LoginCustomerApp(),
        '/dashboardAgent': (BuildContext context) => new DashboardAgent(),
        '/dashboardCustomer': (BuildContext context) => new DashboardCustomer(),
        '/homeAgent': (BuildContext context) => new HomeAgent(),
        '/homeCustomer': (BuildContext context) => new HomeCustomer(),
        '/registrasiCustomer': (BuildContext context) => new RegistrasiCustomer(),
        '/generateQrCode': (BuildContext context) => new GenerateQrCode(),
        '/registrasiCustomer': (BuildContext context) => new RegistrasiCustomer(),
        '/scanHasilRapidTest': (BuildContext context) => new ScanHasilRapidTest(),
      },
      theme: ThemeData(fontFamily: 'Lato'),
      home: ChooseApp(),
    ),
  );
}
