import 'package:fitness_magazine/models/big_card.dart';
import 'package:fitness_magazine/styles/style.dart';
import 'package:flutter/material.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({super.key, required this.card});

  final BigCard card;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: 300,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(card.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
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
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 5,
                  bottom: 5,
                ),
                color: card.categoryColor,
                child: Text(card.category, style: style1),
              ),
              Text(card.headingText, style: style2),
              Text(
                card.paragraph,
                style: style3,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
