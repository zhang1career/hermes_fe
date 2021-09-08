import 'package:flutter/material.dart';
import 'package:hermes_fe/page/indicator_page.dart';
import 'package:hermes_fe/service/indicator_service.dart';
import 'package:hermes_fe/vo/indicator_vo_lite.dart';

class IndicatorListPage extends StatelessWidget {
  IndicatorListPage(
      {Key? key, required this.title, required this.data})
      : super(key: key);

  final String title;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    Future<List<IndicatorVoLite>> indicatorVoLiteList = data['indicator_list'];

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: FutureBuilder<List<IndicatorVoLite>>(
                future: indicatorVoLiteList,
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
                })));
  }

  Widget _buildListView(List<IndicatorVoLite>? indicatorVoList) {
    return ListView.builder(
      itemCount: indicatorVoList!.length,
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

  static Map<String, dynamic> prepare() {
    Map<String, dynamic> ret = new Map();
    ret['indicator_list'] = fetchIndicatorList();
    return ret;
  }
}
