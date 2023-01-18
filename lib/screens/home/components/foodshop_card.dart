import 'package:flutter/material.dart';

class FoodShopCard extends StatelessWidget {
  const FoodShopCard({
    Key? key,
    required this.imageSrc,
    required this.menuName,
    required this.shopName,
    required this.price,
    this.promotion,
    required this.press,
    this.widthCard = 100,
    this.heightCard = 100,
    this.maxHeight = 210,
  }) : super(key: key);

  final String imageSrc;
  final String menuName;
  final String shopName;
  final double price;
  final double widthCard;
  final double heightCard;
  final double maxHeight;
  // ignore: prefer_typing_uninitialized_variables
  final promotion;
  final Function press;

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: _press,
          child: SizedBox(
            width: widthCard,
            height: maxHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      imageSrc,
                      width: widthCard,
                      height: heightCard,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(menuName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Prompt',
                        height: 1.50,
                        color: const Color(
                          0xFF1C1C1C,
                        ),
                        fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 5,
                ),
                Text(shopName,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Prompt',
                        height: 1.25,
                        color: const Color(0xFF676767).withOpacity(0.8))),
                const SizedBox(
                  height: 5,
                ),
                Text('฿ $price',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontFamily: 'Prompt',
                        height: 1.25,
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: Colors.grey[900])),
              ],
            ),
          ),
        ));
  }
}
