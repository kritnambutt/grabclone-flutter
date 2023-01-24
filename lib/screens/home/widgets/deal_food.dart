import 'package:flutter/material.dart';
import 'package:grabclone/models/Deal.dart';
import 'package:grabclone/screens/home/components/deal_card.dart';

class DealFoodContent extends StatelessWidget {
  const DealFoodContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double widthCard = 130;

    return GestureDetector(
        onTap: () {},
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      'รวมดีลสุดคุ้มจาก GrabFood',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontFamily: 'Prompt', color: const Color(0xFF3D3D3D)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                          children: List.generate(deal_example.length, (index) {
                        var dataIndex = deal_example[index];

                        return DealCard(
                          widthCard: widthCard,
                          imageSrc: dataIndex.imageSrc,
                          title: dataIndex.title,
                          description: dataIndex.description,
                          promotion: dataIndex.promotion,
                          press: dataIndex.press,
                        );
                      })))),
              const SizedBox(
                height: 30,
              ),
            ]));
  }
}
