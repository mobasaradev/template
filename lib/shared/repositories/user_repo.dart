import 'dart:convert';

import 'package:api_template/shared/model/user.dart';
import 'package:api_template/shared/services/web_api_service.dart';

class UserRepo {
  final _webApiService = WebApiService();

  // List<User>? _parseUsers(String bodyStr) {
    // if json root [
    // {'name' : 'Sara'}
    // {}
    // ]
    // final jsonList = jsonDecode(bodyStr) as List?;
    // if (jsonList != null) {
    //   final users = [for (var json in jsonList) User.fromJson(json)];
    //   return users;
    // }

    // if json root {}
    // final jsonMap = jsonDecode(bodyStr) as Map?;
    // if (jsonMap != null) {
      // it's for get the array data of root object
  //     final jsons = jsonMap['users'];
  //     final users = [for (var json in jsons) User.fromJson(json)];
  //     return users;
  //   }
  //   return null;
  // }

  Future<List<User>?> users() async {
    final response = await _webApiService.requestUsers();
    if (response != null) {
      final bodyStr = await response.stream.bytesToString();
      final jsonMap = jsonDecode(bodyStr) as Map?;
      if (jsonMap != null) {
        final jsons = jsonMap['users'];
        final users = [for (var json in jsons) User.fromJson(json)];
        return users;
      }
      // return _parseUsers(bodyStr);
    }
    return null;
  }
}
