import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_magazine/app/dimentions.dart';
import 'package:fitness_magazine/models/article.dart';
import 'package:fitness_magazine/views/custom_widgets/favorite_button.dart';
import 'package:fitness_magazine/views/details_page.dart';
import 'package:fitness_magazine/app/themes.dart';
import 'package:flutter/material.dart';

class ArticleListCard extends StatelessWidget {
  const ArticleListCard({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              child: CachedNetworkImage(
                height: 125,
                imageUrl: article.image,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Image.asset(
                      'assets/icons/png/placeholder.png',
                      fit: BoxFit.cover,
                    ),
                errorWidget:
                    (context, url, error) => Image.asset(
                      'assets/icons/png/error.png',
                      fit: BoxFit.cover,
                    ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 125,
              decoration: BoxDecoration(
                color: colors[article.category],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: style4,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  dimentionH2,
                  Text(
                    article.content,
                    style: style4,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.share, color: Colors.white),
                      ),
                      FavoriteButton(article: article),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailsPage(article: article);
                              },
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
