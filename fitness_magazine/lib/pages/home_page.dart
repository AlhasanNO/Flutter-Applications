import 'package:fitness_magazine/models/big_card.dart';
import 'package:fitness_magazine/models/small_card.dart';
import 'package:fitness_magazine/styles/style.dart';
import 'package:fitness_magazine/widgets/featured_card.dart';
import 'package:fitness_magazine/widgets/mini_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text('مجلة صحية', style: style1))),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      FeaturedCard(
                        card: BigCard(
                          image: 'assets/icons/png/placeholder.png',
                          category: 'لياقة',
                          categoryColor: Color(0xFFfccd0a),
                          headingText:
                              'تمارين الكارديو وحدها لا تساعد على فقدان الوزن',
                          paragraph:
                              'تمارين الكارديو من اهم التمارين الرياضية التي تساعدك على كمية اكبر من الألابلايالابالاب',
                        ),
                      ),
                      FeaturedCard(
                        card: BigCard(
                          image: 'assets/icons/png/placeholder.png',
                          category: 'لياقة',
                          categoryColor: Color(0xFFfccd0a),
                          headingText:
                              'تمارين الكارديو وحدها لا تساعد على فقدان الوزن',
                          paragraph:
                              'تمارين الكارديو من اهم التمارين الرياضية التي تساعدك على كمية اكبر من الألابلايالابالاب',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TabBar(
              tabs: [Text('تغذية'), Text('صحة'), Text('جمال'), Text('لياقة')],
            ),
            Expanded(
              flex: 6,
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      dimentionH10,
                      MiniCard(
                        card: SmallCard(
                          color: Color(0xFFfccd0a),
                          image: 'assets/icons/png/placeholder.png',
                          headingText: 'ما الذاكرة العضلية.. وكيف نزيدها',
                          paragraph: 'أشهر تمارين الاسترخاء',
                        ),
                      ),
                      dimentionH10,
                      MiniCard(
                        card: SmallCard(
                          color: Color(0xFFfccd0a),
                          image: 'assets/icons/png/placeholder.png',
                          headingText: 'ما الذاكرة العضلية.. وكيف نزيدها',
                          paragraph: 'أشهر تمارين الاسترخاء',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
