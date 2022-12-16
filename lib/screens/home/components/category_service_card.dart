import 'package:flutter/material.dart';

class CategoryServiceCard extends StatelessWidget {
  const CategoryServiceCard({
    Key? key,
    required this.imageSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String imageSrc;
  final String title;
  final Function press;

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _press,
      child: SizedBox(
        height: 80,
        child: Column(
          children: <Widget>[
            Image.asset(
              imageSrc,
              height: 50,
              width: 50,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(fontFamily: 'Prompt', fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
