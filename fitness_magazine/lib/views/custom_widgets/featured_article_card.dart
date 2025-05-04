import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_magazine/models/article.dart';
import 'package:fitness_magazine/views/details_page.dart';
import 'package:fitness_magazine/views/themes/themes.dart';
import 'package:flutter/material.dart';

class FeaturedArticleCard extends StatelessWidget {
  const FeaturedArticleCard({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailsPage(article: article);
            },
          ),
        );
      },
      child: SizedBox(
        width: 270,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    width: 270,
                    height: 200,
                    imageUrl: article.image,
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) => Center(
                          child: Image.asset(
                            'assets/icons/png/placeholder.png',
                            fit: BoxFit.cover,
                          ),
                        ),

                    errorWidget:
                        (context, url, error) => Center(
                          child: Image.asset(
                            'assets/icons/png/error.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                  ),
                ),
                Positioned(
                  left: 5,
                  top: 5,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.favorite_outline, color: Colors.white),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dimentionH10,
                Container(
                  color: colors[article.category],
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Text(article.category, style: style1),
                ),
                dimentionH5,
                Text(
                  article.title,
                  style: style2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                dimentionH5,
                Text(
                  article.content,
                  style: style3,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
