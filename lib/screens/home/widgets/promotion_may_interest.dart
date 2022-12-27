import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grabclone/models/Promotion.dart';

class PromotionMayLikeContent extends StatelessWidget {
  const PromotionMayLikeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthCard = (size.width - (20 * 2) - 20) / 3;

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
                      'โปรโมชั่นที่คุณอาจสนใจ',
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
                              promotion_may_interest_data.length, (index) {
                        var dataIndex = promotion_may_interest_data[index];

                        return PromotionMayInterestCard(
                            imageSrc: dataIndex.imageSrc,
                            title: dataIndex.title,
                            service: dataIndex.service,
                            press: dataIndex.press);
                      })))),
              const SizedBox(
                height: 30,
              ),
            ]));
  }
}

class PromotionMayInterestCard extends StatelessWidget {
  const PromotionMayInterestCard({
    Key? key,
    required this.imageSrc,
    required this.title,
    required this.service,
    required this.press,
  }) : super(key: key);

  final String imageSrc;
  final String title;
  final String service;
  final Function press;

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _press,
        child: Container(
          width: 320,
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE8E8E8)),
              borderRadius: BorderRadius.circular(6)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  imageSrc,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'Prompt',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    Text(service,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontFamily: 'Prompt',
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
