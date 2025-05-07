import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_magazine/app/dimentions.dart';
import 'package:fitness_magazine/models/article.dart';
import 'package:fitness_magazine/app/themes.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.article});

  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Hero(
                  tag: article.image,
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: 300,
                    imageUrl: article.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 280,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 18.0, right: 18.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          dimentionH15,
                          Center(child: Text(article.title, style: style6)),
                          dimentionH15,
                          Text(article.content, style: style5),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back, size: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
