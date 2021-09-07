import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

import 'package:hermes_fe/vo/indicator_vo.dart';

Future<List<IndicatorVo>> fetchIndicatorList() async {
  final response = await http.get(
      Uri.parse("http://localhost:8080/api/indicators"),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to load server data');
  }

  String bodyUtf8 = Utf8Decoder().convert(response.bodyBytes);
  var responseJson = json.decode(bodyUtf8);
  return (responseJson as List).map((p) => IndicatorVo.fromJson(p)).toList();
}

// Future<IndicatorVo> fetchIndicatorItem(int id) async {
//   final response = await http.get(
//       Uri.parse(sprintf("http://localhost:8080/api/indicators/%d", id)),
//       headers: {
//         "Accept": "application/json",
//         "Access-Control-Allow-Origin": "*"
//       }
//   );
//
//   if (response.statusCode != 200) {
//     throw Exception('Failed to load server data');
//   }
//
//   String bodyUtf8 = Utf8Decoder().convert(response.bodyBytes);
//   var responseJson = json.decode(bodyUtf8);
//   return IndicatorVo.fromJson(responseJson);
// }
