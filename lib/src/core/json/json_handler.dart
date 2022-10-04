import 'dart:convert';

import 'package:dio/dio.dart';

class JsonHandler {
  static dynamic encodeJson(dynamic jsonObject) {
    return json.encode(jsonObject);
  }

  static dynamic decodeJson(Response<dynamic> response) {
    return json.decode(response.data.toString());
  }
}
