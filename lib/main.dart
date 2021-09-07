import 'dart:async';

import 'package:flutter/material.dart';

import 'vo/indicator_vo.dart';
import 'page/indicator_list_page.dart';
import 'service/indicator_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late Future<List<IndicatorVo>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchIndicatorList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hermes, an indicator Engine",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IndicatorListPage(title: "Hermes, an indicator Engine", indicatorVoList: futureData),
    );
  }
}
