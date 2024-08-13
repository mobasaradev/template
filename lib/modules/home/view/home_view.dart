import 'package:api_template/modules/recipe/view/recipe_page.dart';
import 'package:api_template/modules/users/view/users_page.dart';
import 'package:api_template/shared/model/item.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      Items(
        imgUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtPyxGKybSpG2tEyeHPaIyoAvIn3dUbJGpWJ1pqe_-ROdV14KAty1F6C6Oby47qYr5ibg&usqp=CAU",
        title: "Users",
      ),
      Items(
        imgUrl:
            "https://www.pngall.com/wp-content/uploads/8/Cooking-Recipe-PNG-Images.png",
        title: "Recipes",
      ),
    ];
    return Scaffold(
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(context, UsersPage.route);
                  break;
                case 1:
                  Navigator.push(context, RecipePage.route);
                  break;
                default:
                  break;
              }
            },
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    item.imgUrl,
                    height: 150,
                    width: 150,
                  ),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
