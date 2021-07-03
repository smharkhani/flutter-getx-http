import 'package:http/http.dart' as http;

import '../utils/url.dart';

class Request {
  final String url;
  final dynamic body;

  Request({this.url, this.body});

  /// Get Request
  Future<http.Response> get() {
    return http.get(Uri.parse(baseUrl + url));
  }

  ///Post Request
  Future<http.Response> post() {
    if (body != null) {
      return http.post(Uri.parse(baseUrl + url), body: body);
    } else {
      return http.post(Uri.parse(baseUrl + url));
    }
  }
}
