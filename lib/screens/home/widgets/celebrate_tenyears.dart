import 'package:flutter/material.dart';
import 'package:grabclone/models/CelebrateTenYears.dart';

class CelebrateTenYearsContents extends StatelessWidget {
  const CelebrateTenYearsContents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthCard = (size.width - (20 * 2) - 10) / 2;
    final double itemHeight = widthCard + 80;
    final double itemWidth = widthCard;

    return GestureDetector(
        onTap: () {},
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          'Grab ฉลองปีที่ 10 เสกสุขทุกบริการ',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontFamily: 'Prompt',
                                  color: const Color(0xFF3D3D3D)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    child: GridView.count(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: (itemWidth / itemHeight),
                        children: List.generate(celebrate_ten_years_data.length,
                            (index) {
                          var dataIndex = celebrate_ten_years_data[index];

                          return CelebrateTenYearsCard(
                            imageSrc: dataIndex.imageSrc,
                            title: dataIndex.title,
                            description: dataIndex.description,
                            press: dataIndex.press,
                          );
                        }))),
              ),
              const SizedBox(
                height: 30,
              ),
            ]));
  }
}

class CelebrateTenYearsCard extends StatelessWidget {
  const CelebrateTenYearsCard({
    Key? key,
    required this.press,
    required this.imageSrc,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String imageSrc, title, description;
  final Function press;

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthCard = (size.width - (20 * 2) - 10) / 2;

    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _press,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    imageSrc,
                    width: widthCard,
                    height: widthCard,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontFamily: 'Prompt',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1C1C1C)),
              ),
              Text(
                description,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontFamily: 'Prompt',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF676767)),
              ),
            ]));
  }
}
