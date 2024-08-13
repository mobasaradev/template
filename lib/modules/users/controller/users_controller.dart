import 'package:api_template/shared/model/user.dart';
import 'package:api_template/shared/repositories/user_repo.dart';
import 'package:flutter/material.dart';

class UsersController extends ChangeNotifier {
  // Constructor body use as initial function.
  UsersController({required UserRepo userRepo}) {
    _isLoading = true;
    userRepo.users().then((users) {
      _users = users;
      _isLoading = false;
      notifyListeners();
    });
  }

  // state
  List<User>? _users = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<User>? get users => _users;
}
