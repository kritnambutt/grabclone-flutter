import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PromotionMayLikeContent extends StatelessWidget {
  const PromotionMayLikeContent({
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
                        'โปรโมชั่นที่คุณอาจสนใจ',
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
                      scrollDirection: Axis.horizontal, child: Container()),
                  const SizedBox(
                    height: 30,
                  ),
                ])));
  }
}
