import 'package:fitness_magazine/app/dimentions.dart';
import 'package:fitness_magazine/models/repo.dart';
import 'package:fitness_magazine/app/themes.dart';
import 'package:fitness_magazine/views/custom_widgets/featured_article_card.dart';
import 'package:fitness_magazine/views/custom_widgets/article_list_card.dart';
import 'package:fitness_magazine/views/favorite_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final nutritionArticles =
      articles.where((a) => a.category == 'تغذية').toList();
  final beautyArticles = articles.where((a) => a.category == 'جمال').toList();
  final healthArticles = articles.where((a) => a.category == 'صحة').toList();
  final fitnessArticles = articles.where((a) => a.category == 'لياقة').toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('مجلة صحية', style: style1)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return FavoritePage();
                    },
                  ),
                );
              },
              icon: Icon(Icons.favorite, color: Colors.white),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 7,
              child: ListView.separated(
                padding: const EdgeInsets.all(15.0),
                scrollDirection: Axis.horizontal,
                itemCount: articles.length,
                separatorBuilder:
                    (BuildContext context, int index) => dimentionW15,
                itemBuilder: (context, index) {
                  return FeaturedArticleCard(article: articles[index]);
                },
              ),
            ),
            TabBar(
              labelColor: Color(0xFF364046),
              indicatorColor: Color(0xFF364046),
              dividerHeight: 0.0,
              tabs: [
                SizedBox(height: 30.0, child: Text('تغذية')),
                SizedBox(height: 30.0, child: Text('صحة')),
                SizedBox(height: 30.0, child: Text('جمال')),
                SizedBox(height: 30.0, child: Text('لياقة')),
              ],
            ),
            dimentionH10,
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: TabBarView(
                  children: [
                    ListView.separated(
                      itemCount: nutritionArticles.length,
                      separatorBuilder: (context, index) => dimentionH10,
                      itemBuilder: (context, index) {
                        return ArticleListCard(
                          article: nutritionArticles[index],
                        );
                      },
                    ),
                    ListView.separated(
                      itemCount: healthArticles.length,
                      separatorBuilder: (context, index) => dimentionH10,
                      itemBuilder: (context, index) {
                        return ArticleListCard(article: healthArticles[index]);
                      },
                    ),
                    ListView.separated(
                      itemCount: beautyArticles.length,
                      separatorBuilder: (context, index) => dimentionH10,
                      itemBuilder: (context, index) {
                        return ArticleListCard(article: beautyArticles[index]);
                      },
                    ),
                    ListView.separated(
                      itemCount: fitnessArticles.length,
                      separatorBuilder: (context, index) => dimentionH10,
                      itemBuilder: (context, index) {
                        return ArticleListCard(article: fitnessArticles[index]);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
