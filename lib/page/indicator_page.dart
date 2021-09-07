import 'package:flutter/material.dart';
import '../vo/indicator_vo.dart';

class IndicatorPage extends StatelessWidget {
  IndicatorPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final indicatorVo = ModalRoute.of(context)!.settings.arguments as IndicatorVo;

    return Scaffold(
      appBar: AppBar(
        title: Text(indicatorVo.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(indicatorVo.expression),
      ),
    );
  }
}
