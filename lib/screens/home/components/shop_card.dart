import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    Key? key,
    required this.imageSrc,
    required this.shopName,
    required this.distance,
    this.promotion,
    required this.press,
    this.widthCard = 100,
    this.heightCard = 100,
    this.maxHeight = 210,
  }) : super(key: key);

  final String imageSrc;
  final String shopName;
  final String distance;
  final double widthCard;
  final double heightCard;
  final double maxHeight;
  // ignore: prefer_typing_uninitialized_variables
  final promotion;
  final Function press;

  void _press() {
    press();
  }

  Widget showPromotionWidget(BuildContext context) {
    if (promotion != null) {
      return Container(
        height: 20,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: const Color(0xFFFFF4EA),
            borderRadius: BorderRadius.circular(3)),
        child: Text(
          promotion,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontFamily: 'Prompt',
              color: const Color(
                0xFF1C1C1C,
              ),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      );
    } else {
      return Container();
    }
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
                    child: Image.asset(
                      imageSrc,
                      width: widthCard,
                      height: heightCard,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(shopName,
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
                Text('$distance km',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Prompt',
                        height: 1.25,
                        color: const Color(0xFF676767).withOpacity(0.8))),
                const SizedBox(
                  height: 15,
                ),
                showPromotionWidget(context)
              ],
            ),
          ),
        ));
  }
}
