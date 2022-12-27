import 'package:flutter/material.dart';
import 'package:grabclone/constants.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String svgSrc;
  final String title;
  final Function press;

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 17,
                  spreadRadius: -23,
                  color: kShadowColor)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                const Spacer(),
                SvgPicture.asset(svgSrc,
                    height: 60, width: 60, fit: BoxFit.scaleDown),
                const Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 13),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
