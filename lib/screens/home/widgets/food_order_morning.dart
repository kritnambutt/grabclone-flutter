import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/Shop.dart';
import '../components/shop_card.dart';

class FoodOrderMorningContent extends StatelessWidget {
  const FoodOrderMorningContent({
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
                      'สั่งมื้อเข้าจาก',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontFamily: 'Prompt', color: const Color(0xFF3D3D3D)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/right-arrow-fill.svg',
                      width: 20,
                      height: 20,
                      color: const Color(0x66808080),
                      fit: BoxFit.scaleDown,
                    )
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
                          children: List.generate(
                              recent_shop_food.length,
                              (index) => ShopCard(
                                    widthCard: widthCard,
                                    imageSrc: recent_shop_food[index].imageSrc,
                                    shopName: recent_shop_food[index].shopName,
                                    distance: recent_shop_food[index].distance,
                                    promotion:
                                        recent_shop_food[index].promotion,
                                    press: recent_shop_food[index].press,
                                  ))))),
              const SizedBox(
                height: 30,
              ),
            ]));
  }
}
