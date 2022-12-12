import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/setting_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentActive = 'calendar';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            svgSrc: 'assets/icons/calendar.svg',
            title: 'Today',
            press: () {},
            isActive: currentActive == 'calendar' ? true : false,
          ),
          BottomNavItem(
            svgSrc: 'assets/icons/dumbbell.svg',
            title: 'All Excercises',
            press: () {},
            isActive: currentActive == 'all_excercises' ? true : false,
          ),
          BottomNavItem(
            svgSrc: 'assets/icons/settings.svg',
            title: 'Settings',
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SettingScreen();
              }));
            },
            isActive: currentActive == 'settings' ? true : false,
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  final String svgSrc;
  final String title;
  final Function press;
  final bool isActive;

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(svgSrc,
              height: 30,
              width: 30,
              fit: BoxFit.scaleDown,
              color: isActive ? kActiveIconColor : kTextColor),
          Text(
            title,
            style: TextStyle(
                fontSize: 12, color: isActive ? kActiveIconColor : kTextColor),
          )
        ],
      ),
    );
  }
}
