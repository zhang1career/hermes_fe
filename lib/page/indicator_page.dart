import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hermes_fe/page/indicator_list_page.dart';
import 'package:hermes_fe/service/indicator_service.dart';
import 'package:hermes_fe/vo/expression_vo.dart';
import 'package:hermes_fe/vo/indicator_vo.dart';
import 'package:hermes_fe/vo/indicator_vo_lite.dart';

class IndicatorPage extends StatelessWidget {
  IndicatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Future<IndicatorVo> indicatorVo = data['indicator'];

    return Scaffold(
      appBar: AppBar(
        title: Text('asdf'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<IndicatorVo> (
          future: indicatorVo,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError) {
                    return new Text('Error: ${snapshot.error}');
                  }
                  return _buildListView(snapshot.data);
              }
            }
        )
      ),
    );
  }

  static Map<String, dynamic> prepare(int index) {
    Map<String, dynamic> ret = new Map();
    ret['indicator'] = fetchIndicator(index);
    return ret;
  }

  Widget _buildListView(IndicatorVo? indicatorVo) {
    if (indicatorVo!.children.isEmpty) {
      return Text('asdf');
    }

    List<IndicatorVoLite> indicatorVoList = indicatorVo.children;
    return ListView.builder(
      itemCount: indicatorVoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(indicatorVoList[index].name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IndicatorPage(),
                settings: RouteSettings(
                  arguments: IndicatorPage.prepare(indicatorVoList[index].id),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
