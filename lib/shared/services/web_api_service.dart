import 'dart:developer';

import 'package:http/http.dart';

class WebApiService {
  // Singleton prevents different instantiation
  // Lazy Singleton
  WebApiService._();
  static WebApiService? _instance;
  factory WebApiService() => _instance ??= WebApiService._();

  // eager Singleton
  // WebApiService._();
  // static final _instance = WebApiService._();
  // factory WebApiService() => _instance;

  //-- Configs
  String get baseUrl => 'https://dummyjson.com';

  Future<StreamedResponse?> requestUsers() async {
    final url = Uri.parse("$baseUrl/users");
    // final url = Uri.parse("$baseUrl/users")..queryParameters.addAll({});
    final request = Request('GET', url);
    request.headers.addAll({'Content-Type': 'application/json'});
    // request.body = jsonEncode({
    //   "name": "",
    //   "username": "",
    //   "email": ""
    // });

    try {
      final response = await request.send();
      return _checkStatusCode(response);
    } catch (e, s) {
      log("WebApiService: Couldn't request users!", error: e, stackTrace: s);
    }
    return null;
  }

  Future<StreamedResponse?> requestRecipes() async {
    try {
      final url = Uri.parse("$baseUrl/recipes");
      final request = Request("GET", url);
      final response = await request.send();
      return _checkStatusCode(response);
    } catch (e, s) {
      log("WebApiService: Couldn't request Recipes", error: e, stackTrace: s);
    }
    return null;
  }


  // cascade operator (..) - call properties on same object.

  //-- Post APIs
  // Future<StreamedResponse?> requestSms(Map<String, String> body) async {
  //   try {
  //     final request = Request('POST', Uri.parse(baseUrl))
  //       ..body = jsonEncode(body)
  //       ..headers.addAll(_getHeaders(encoded: false));
  //     final response = await request.send();
  //     return _checkStatusCode(response);
  //   } catch (e, s) {
  //     log("WebApiService: Couldn't request SMS", error: e, stackTrace: s);
  //   }
  //   return null;
  // }

  /// Get basic headers.
  Map<String, String> _getHeaders({bool isGet = false, bool encoded = true}) =>
      {
        if (!isGet) 'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  /// Check status code and return 'null' if not between 200 to 299
  StreamedResponse? _checkStatusCode(StreamedResponse response) =>
      response.statusCode >= 200 && response.statusCode < 300 ? response : null;
}
