import 'dart:collection';
import 'dart:io';

import 'package:http/http.dart' as http;

class FittrixService {

  static Uri get LOGIN => Uri.parse("https://my-json-server.typicode.com/ssyeon84/fittrix-api/login");
  static Uri get WRITE => Uri.parse("https://my-json-server.typicode.com/ssyeon84/fittrix-api/write");
  static Uri get LIST => Uri.parse("https://my-json-server.typicode.com/ssyeon84/fittrix-api/list");

  static Map<String, String> _setDefaultHeader() {
    Map<String, String> headers = HashMap();
    headers[HttpHeaders.accessControlAllowOriginHeader] = "*";
    headers[HttpHeaders.contentTypeHeader] = "application/json";
    return headers;
  }

  Future<http.Response?> login() async {
    http.Response response = await http.get(LOGIN, headers: _setDefaultHeader());
    if(response.statusCode == HttpStatus.ok) {
      return Future.value(response);
    }
  }

  Future<http.Response?> write() async {
    http.Response response = await http.get(LOGIN, headers: _setDefaultHeader());
    if(response.statusCode == HttpStatus.ok) {
      return Future.value(response);
    }
  }

  Future<http.Response?> list() async {
    http.Response response = await http.get(LOGIN, headers: _setDefaultHeader());
    if(response.statusCode == HttpStatus.ok) {
      return Future.value(response);
    }
  }

}