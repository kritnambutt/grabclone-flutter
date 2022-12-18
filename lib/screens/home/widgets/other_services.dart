import 'package:flutter/material.dart';

class OtherServicesContent extends StatelessWidget {
  const OtherServicesContent({
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
                      'บริการอื่นๆจาก Grab',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontFamily: 'Prompt', color: const Color(0xFF3D3D3D)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: widthCard,
                  child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: <Widget>[
                        OtherServiceCard(
                          imageSrc:
                              'assets/icons/other_services/grab_unlimited.png',
                          title: 'Grab Unlimited',
                          tags: '฿1/เดือน',
                          press: () {},
                        ),
                        OtherServiceCard(
                          imageSrc: 'assets/icons/other_services/reward.png',
                          title: 'รีวอร์ด',
                          press: () {},
                        ),
                        OtherServiceCard(
                          imageSrc:
                              'assets/icons/other_services/home_service.png',
                          title: 'โฮมเซอร์วิส',
                          press: () {},
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ]));
  }
}

class OtherServiceCard extends StatelessWidget {
  const OtherServiceCard({
    Key? key,
    required this.imageSrc,
    required this.title,
    this.tags,
    required this.press,
  }) : super(key: key);

  final String imageSrc;
  final String title;
  final tags;
  final Function press;

  void _press() {
    press();
  }

  Widget showTagWidget(BuildContext context) {
    if (tags != null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
            color: Color(0xFFEE6252), borderRadius: BorderRadius.circular(15)),
        child: Text(
          tags,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontFamily: 'Prompt', color: Colors.white, fontSize: 10),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthCard = (size.width - (20 * 2) - 20) / 3;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _press,
      child: Container(
        height: widthCard,
        width: widthCard,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            color: Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(8)),
        child: Stack(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontFamily: 'Prompt',
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              showTagWidget(context)
            ],
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                imageSrc,
                width: 40,
                height: 40,
                fit: BoxFit.scaleDown,
              ))
        ]),
      ),
    );
  }
}
