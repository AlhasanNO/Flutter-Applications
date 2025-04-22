import 'package:fitness_magazine/models/small_card.dart';
import 'package:fitness_magazine/styles/style.dart';
import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  const MiniCard({super.key, required this.card});

  final SmallCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: card.color,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),

                image: DecorationImage(
                  image: AssetImage(card.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.headingText,
                        style: style4,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        card.paragraph,
                        style: style4,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Row(
                      children: [
                        Icon(Icons.share, color: Colors.white),
                        dimentionW10,
                        Icon(Icons.favorite_outline, color: Colors.white),
                        dimentionW10,
                        Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
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
