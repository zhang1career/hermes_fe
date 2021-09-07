import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hermes_fe/vo/expression_vo.dart';
import 'package:hermes_fe/vo/indicator_vo.dart';

class IndicatorPage extends StatelessWidget {
  IndicatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indicatorVo = ModalRoute.of(context)!.settings.arguments as IndicatorVo;
    Map<String, dynamic> expressionMap = _parseExpression(indicatorVo.expression);
    final expressionVo = ExpressionVo.fromJson(expressionMap);

    return Scaffold(
      appBar: AppBar(
        title: Text(indicatorVo.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // child: Text(indicatorVo.expression),
        child: _buildExpression(expressionVo),
      ),
    );
  }

  Widget _buildExpression(ExpressionVo expressionVo) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Container(
          width: 160.0,
          color: Colors.lightBlue,
          child: Text(expressionVo.name),
        ),
        new Container(
          width: 160.0,
          color: Colors.lightBlue,
          child: Text(expressionVo.type.toString()),
        ),
        new Container(
          width: 160.0,
          color: Colors.lightBlue,
          child: Text(expressionVo.value.toString()),
        ),
      ],
    );
  }

  Map<String, dynamic> _parseExpression(String expression) {
    return json.decode(expression);
  }
}
