import 'dart:convert';

import 'package:briidea/responsive/Responsive_Layout.dart';
import 'package:briidea/responsive/desktop_body.dart';
import 'package:briidea/responsive/mobile_body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(mobileBody: MyMobileBody(), desktopApp: MyDesktopBody(),),
    );
  }

}




