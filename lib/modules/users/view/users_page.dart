import 'package:api_template/modules/users/controller/users_controller.dart';
import 'package:api_template/modules/users/view/users_view.dart';
import 'package:api_template/shared/repositories/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});
  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const UsersPage(),
      );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersController(userRepo: UserRepo()),
      child: const UsersView(),
    );
  }
}
