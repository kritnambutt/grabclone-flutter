import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdvertiserCard extends StatelessWidget {
  const AdvertiserCard({
    Key? key,
    required this.image,
    required this.headerTitle,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image;
  final String headerTitle;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  headerTitle,
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
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(image)),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontFamily: 'Prompt',
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w700),
            ),
            Text(description,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontFamily: 'Prompt',
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w300))
          ],
        ),
      ),
    );
  }
}
