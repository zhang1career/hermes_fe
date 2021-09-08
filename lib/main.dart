import 'package:flutter/material.dart';
import 'package:hermes_fe/page/indicator_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = IndicatorListPage.prepare();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hermes, an indicator Engine",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IndicatorListPage(title: "Hermes, an indicator Engine", data: data),
    );
  }
}
