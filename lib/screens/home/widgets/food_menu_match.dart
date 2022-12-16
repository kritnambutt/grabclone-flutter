import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/Food.dart';
import '../components/foodshop_card.dart';

class FoodMenuMatchWithYouContent extends StatelessWidget {
  const FoodMenuMatchWithYouContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double widthCard = 130;

    return GestureDetector(
        onTap: () {},
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'เมนูสำหรับคุณ',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Prompt',
                            color: const Color(0xFF3D3D3D)),
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
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                              children: List.generate(
                                  menu_match_with_you_shop_food.length,
                                  (index) {
                            var dataIndex =
                                menu_match_with_you_shop_food[index];

                            return FoodShopCard(
                              widthCard: widthCard,
                              imageSrc: dataIndex.imageSrc,
                              menuName: dataIndex.menuName,
                              shopName: dataIndex.shopName,
                              price: dataIndex.price,
                              promotion: dataIndex.promotion,
                              press: dataIndex.press,
                            );
                          })))),
                  const SizedBox(
                    height: 30,
                  ),
                ])));
  }
}
