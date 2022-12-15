import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/Shop.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/widgets/bottom_nav_bar.dart';

// import 'package:my_app/screens/detail_screen.dart';
// import 'package:my_app/widgets/catogory_card.dart';
// import 'package:my_app/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F5EFF),
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFF0F5EFF),
            statusBarBrightness: Brightness.light,
            // statusBarBrightness: Brightness.dark,
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                HeaderContent(),
                SizedBox(
                  height: 15,
                ),
                CategoryServices(),
                SizedBox(
                  height: 15,
                ),
                SummaryContent(),
                AdvertiserCard(
                  headerTitle: 'สั่งเลย เพียง 199.-',
                  image: 'assets/images/illustrations/advertise.png',
                  title: "ความค้มอีกขั้น กับ GrabUnlimited แพ็กเกจ",
                  description: 'สนับสนุนโดย GrabFood',
                ),
                LastOrderFoodContent(),
              ]),
        ));
  }
}

class LastOrderFoodContent extends StatelessWidget {
  const LastOrderFoodContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'ร้านที่คุณเคยสั่ง',
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
                  const RecentShopFoodContent(),
                  const SizedBox(
                    height: 30,
                  ),
                ])));
  }
}

class RecentShopFoodContent extends StatelessWidget {
  const RecentShopFoodContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
                children: List.generate(
                    recent_shop_food.length,
                    (index) => ShopCard(
                          imageSrc: recent_shop_food[index].imageSrc,
                          shopName: recent_shop_food[index].shopName,
                          distance: recent_shop_food[index].distance,
                          press: recent_shop_food[index].press,
                        )))));
  }
}

class ShopCard extends StatelessWidget {
  const ShopCard({
    Key? key,
    required this.imageSrc,
    required this.shopName,
    required this.distance,
    this.promotion,
    required this.press,
  }) : super(key: key);

  final String imageSrc;
  final String shopName;
  final String distance;
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
            width: 100,
            height: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imageSrc,
                      width: 100,
                      height: 100,
                      fit: BoxFit.scaleDown,
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
                Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFF4EA),
                      borderRadius: BorderRadius.circular(3)),
                  child: Text(
                    'ลดพิเศษกับเมนูที่ร่วมรายการ',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontFamily: 'Prompt',
                        color: const Color(
                          0xFF1C1C1C,
                        ),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

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
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
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

class SummaryContent extends StatelessWidget {
  const SummaryContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const <Widget>[
              PocketSummaryCard(),
              SizedBox(
                width: 8,
              ),
              LastOrderSummaryCard(),
              SizedBox(
                width: 8,
              ),
              LastOrderRateSummaryCard(),
              SizedBox(
                width: 8,
              ),
              PointSummaryCard()
            ],
          ),
        ));
  }
}

class PointSummaryCard extends StatelessWidget {
  const PointSummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Stack(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'ใช้คะแนน',
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFF3D3D3D)),
              ),
              Text(
                '21',
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1A1A1A)),
              ),
            ],
          ),
          Positioned(
              top: 0,
              bottom: -10,
              right: 0,
              child: Image.asset(
                'assets/icons/crown.png',
                width: 24,
                height: 24,
                fit: BoxFit.scaleDown,
              ))
        ]),
      ),
    );
  }
}

class LastOrderRateSummaryCard extends StatelessWidget {
  const LastOrderRateSummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Stack(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'ให้คะแนน',
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFF3D3D3D)),
              ),
              Text(
                'KHIANG (เขียง) - ตลา...',
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1A1A1A)),
              ),
            ],
          ),
          Positioned(
              top: 0,
              bottom: -10,
              right: 0,
              child: Image.asset(
                'assets/icons/star_point.png',
                width: 24,
                height: 24,
                fit: BoxFit.scaleDown,
              ))
        ]),
      ),
    );
  }
}

class LastOrderSummaryCard extends StatelessWidget {
  const LastOrderSummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Stack(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'รายการ',
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFF3D3D3D)),
              ),
              Text(
                'KHIANG (เขียง) - ตลา...',
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1A1A1A)),
              ),
            ],
          ),
          Positioned(
              top: 0,
              bottom: -10,
              right: 0,
              child: Image.asset(
                'assets/icons/food_bag.png',
                width: 24,
                height: 24,
                fit: BoxFit.scaleDown,
              ))
        ]),
      ),
    );
  }
}

class PocketSummaryCard extends StatelessWidget {
  const PocketSummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Stack(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'ยอดคงเหลือ',
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFF3D3D3D)),
              ),
              Text(
                '฿ 15.10',
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1A1A1A)),
              ),
            ],
          ),
          Positioned(
              top: 0,
              bottom: -10,
              right: 0,
              child: Image.asset(
                'assets/icons/pocket.png',
                width: 24,
                height: 24,
                fit: BoxFit.scaleDown,
              ))
        ]),
      ),
    );
  }
}

class CategoryServices extends StatelessWidget {
  const CategoryServices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: List.generate(
                category_services.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CategoryServiceCard(
                    imageSrc: category_services[index].icon,
                    title: category_services[index].title,
                    press: () {},
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: <Widget>[
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                  color: const Color(0xFFE8E8E8),
                  borderRadius: BorderRadius.circular(6)),
            ),
            Container(
              width: 15,
              height: 5,
              decoration: BoxDecoration(
                  color: const Color(0xFF005238),
                  borderRadius: BorderRadius.circular(6)),
            ),
          ],
        )
      ],
    );
  }
}

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

class HeaderContent extends StatelessWidget {
  const HeaderContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: 150,
      child: Stack(
        children: <Widget>[
          Container(
            height: 120,
            decoration: const BoxDecoration(
              color: Color(0xFF0F5EFF),
            ),
          ),
          SizedBox(
            height: 120,
            child: Container(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                  'assets/images/illustrations/lazada_promote_campaign.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.scaleDown),
            ),
          ),
          Positioned(
              left: 15,
              top: 30,
              child: Text('Lazada 12.12 เซลใหญ่ส่งท้ายปี',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontFamily: 'Prompt', color: Colors.white))),
          Positioned(
              left: 15,
              top: 55,
              child: Row(children: <Widget>[
                Text('Shop now',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontFamily: 'Prompt', color: Colors.white)),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  'assets/icons/right-arrow-fill.svg',
                  width: 15,
                  height: 15,
                  fit: BoxFit.scaleDown,
                )
              ])),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                // alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 54,
                width: size.width - 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kShadowColor)
                    ]),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          width: 15,
                          height: 15,
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "ส้มตำ",
                              hintStyle: TextStyle(
                                  fontFamily: 'Prompt',
                                  color: Colors.grey.withOpacity(0.8)),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 54,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Colors.grey.withOpacity(0.3)))),
                        child: SvgPicture.asset(
                          'assets/icons/scanner.svg',
                          width: 24,
                          height: 24,
                          color: const Color(0xFF707070),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     const backgroundColor = Color(0xFFF5CEB8);

//     return Scaffold(
//         // body: _WidgetBottomNavigationBar()
//         bottomNavigationBar: const BottomNavBar(),
//         body: Stack(
//           children: <Widget>[
//             Container(
//               height: size.height * 0.45,
//               decoration: const BoxDecoration(
//                 color: backgroundColor,
//                 // image: DecorationImage(
//                 //     alignment: Alignment.centerLeft,
//                 //     image: AssetImage(
//                 //         "assets/images/illustrations/pilates-exercise.png"))
//               ),
//             ),
//             SafeArea(
//                 child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 52,
//                             width: 52,
//                             decoration: const BoxDecoration(
//                                 color: Color(0xFFF2BEA1),
//                                 shape: BoxShape.circle),
//                             child: SvgPicture.asset('assets/icons/menu.svg',
//                                 height: 25, width: 25, fit: BoxFit.scaleDown),
//                           ),
//                         ),
//                         Text("Good Mornign \nShishir",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .displaySmall
//                                 ?.copyWith(
//                                     fontWeight: FontWeight.w900, fontSize: 25)),
//                         const SearchBar(),
//                         Expanded(
//                             child: GridView.count(
//                           crossAxisCount: 2,
//                           // childAspectRatio: .85,
//                           crossAxisSpacing: 20,
//                           mainAxisSpacing: 20,
//                           children: <Widget>[
//                             CategoryCard(
//                               svgSrc: 'assets/icons/burger.svg',
//                               title: 'Diet Recommendation',
//                               press: () {},
//                             ),
//                             CategoryCard(
//                                 svgSrc: 'assets/icons/yoga.svg',
//                                 title: 'Yoga',
//                                 press: () {}),
//                             CategoryCard(
//                                 svgSrc: 'assets/icons/meditation.svg',
//                                 title: 'Mediation',
//                                 press: () {
//                                   Navigator.push(context,
//                                       MaterialPageRoute(builder: (context) {
//                                     return const DetailScreen();
//                                   }));
//                                 }),
//                             CategoryCard(
//                               svgSrc: 'assets/icons/burger.svg',
//                               title: 'Diet Recommendation',
//                               press: () {},
//                             )
//                           ],
//                         ))
//                       ],
//                     )))
//           ],
//         ));
//   }
// }
