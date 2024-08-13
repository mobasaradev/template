import 'package:api_template/modules/users/controller/users_controller.dart';
import 'package:api_template/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = context.read<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
      ),
      body: Consumer<UsersController>(
        builder: (context, value, child) {
          final users = value.users;

          return users != null && !value.isLoading
              ? ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      title: Text(user.firstName.toStringNullParse()),
                      leading: user.image == null
                          ? null
                          : Image.network(user.image!),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
