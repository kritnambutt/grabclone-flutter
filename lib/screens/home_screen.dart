import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/screens/detail_screen.dart';
import 'package:my_app/widgets/bottom_nav_bar.dart';
import 'package:my_app/widgets/catogory_card.dart';
import 'package:my_app/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const backgroundColor = Color(0xFFF5CEB8);

    return Scaffold(
        // body: _WidgetBottomNavigationBar()
        bottomNavigationBar: const BottomNavBar(),
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.45,
              decoration: const BoxDecoration(
                color: backgroundColor,
                // image: DecorationImage(
                //     alignment: Alignment.centerLeft,
                //     image: AssetImage(
                //         "assets/images/illustrations/pilates-exercise.png"))
              ),
            ),
            SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            alignment: Alignment.center,
                            height: 52,
                            width: 52,
                            decoration: const BoxDecoration(
                                color: Color(0xFFF2BEA1),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset('assets/icons/menu.svg',
                                height: 25, width: 25, fit: BoxFit.scaleDown),
                          ),
                        ),
                        Text("Good Mornign \nShishir",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w900, fontSize: 25)),
                        const SearchBar(),
                        Expanded(
                            child: GridView.count(
                          crossAxisCount: 2,
                          // childAspectRatio: .85,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: <Widget>[
                            CategoryCard(
                              svgSrc: 'assets/icons/burger.svg',
                              title: 'Diet Recommendation',
                              press: () {},
                            ),
                            CategoryCard(
                                svgSrc: 'assets/icons/yoga.svg',
                                title: 'Yoga',
                                press: () {}),
                            CategoryCard(
                                svgSrc: 'assets/icons/meditation.svg',
                                title: 'Mediation',
                                press: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const DetailScreen();
                                  }));
                                }),
                            CategoryCard(
                              svgSrc: 'assets/icons/burger.svg',
                              title: 'Diet Recommendation',
                              press: () {},
                            )
                          ],
                        ))
                      ],
                    )))
          ],
        ));
  }
}
