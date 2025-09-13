import 'package:fitness_magazine/models/article.dart';
import 'package:fitness_magazine/views/favorite_page.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.article});

  final Article article;
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (isFavorite) {
          favoriteArticles.remove(widget.article);
        } else {
          favoriteArticles.add(widget.article);
        }
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline,
        color: Colors.white,
      ),
    );
  }
}
