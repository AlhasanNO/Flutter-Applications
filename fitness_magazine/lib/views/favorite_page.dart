import 'package:fitness_magazine/app/dimentions.dart';
import 'package:fitness_magazine/app/themes.dart';
import 'package:fitness_magazine/models/article.dart';
import 'package:fitness_magazine/views/custom_widgets/article_list_card.dart';
import 'package:flutter/material.dart';

final List<Article> favoriteArticles = [];

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('المقالات المفضلة', style: style1)),
      body: Center(
        child: SizedBox(
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 15.0, top: 15.0),
            itemCount: favoriteArticles.length,
            separatorBuilder: (BuildContext context, int index) => dimentionH15,
            itemBuilder: (BuildContext context, int index) {
              return ArticleListCard(article: favoriteArticles[index]);
            },
          ),
        ),
      ),
    );
  }
}
