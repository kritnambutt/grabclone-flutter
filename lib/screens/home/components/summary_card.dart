import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.press,
    this.widthCard = 130,
  }) : super(key: key);

  final String icon;
  final String title;
  final String description;
  final Function press;
  final double widthCard;

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _press,
      child: Container(
        width: widthCard,
        height: 60,
        decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Stack(children: <Widget>[
            SizedBox(
              width: widthCard - 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.button?.copyWith(
                        fontFamily: 'Prompt',
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF3D3D3D)),
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.button?.copyWith(
                        fontFamily: 'Prompt',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1A1A1A)),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 0,
                bottom: -10,
                right: 0,
                child: Image.asset(
                  icon,
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
                ))
          ]),
        ),
      ),
    );
  }
}
