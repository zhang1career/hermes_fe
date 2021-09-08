import 'package:hermes_fe/vo/indicator_vo_lite.dart';

class IndicatorVo {
  const IndicatorVo(
      {required this.id,
      required this.name,
      required this.expression,
      required this.children});

  final int id;
  final String name;
  final String expression;
  final List<IndicatorVoLite> children;

  factory IndicatorVo.fromJson(Map<String, dynamic> json) {
    List<IndicatorVoLite> indicatorVoLiteList = [];
    List<dynamic> children = json['children'];
    if (children.isNotEmpty && !(children.length == 1 && children[0] == null)) {
      children.forEach((item) => indicatorVoLiteList
          .add(IndicatorVoLite(id: item['id'], name: item['name'])));
    }
    return IndicatorVo(
        id: json['id'],
        name: json['name'],
        expression: json['expression'],
        children: indicatorVoLiteList);
  }

  bool isLeaf() {
    return true;
  }
}
