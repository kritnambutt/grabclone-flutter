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
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(top: BorderSide(color: Colors.grey.withOpacity(0.3))),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: kShadowColor)
            ]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BottomNavItem(
                icon: "assets/icons/menu/compass.svg",
                title: 'หน้าแรก',
                isActive: true,
                press: () {},
              ),
              BottomNavItem(
                icon: "assets/icons/menu/bill.svg",
                title: 'รายการ',
                press: () {},
              ),
              BottomNavItem(
                icon: "assets/icons/menu/wallet.svg",
                title: 'การชำระเงิน',
                press: () {},
              ),
              BottomNavItem(
                icon: "assets/icons/menu/chat.svg",
                title: 'ข้อความ',
                press: () {},
              ),
              BottomNavItem(
                icon: "assets/icons/menu/user-avatar.svg",
                title: 'บัญชี',
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SettingScreen();
                  }));
                },
              ),
            ]));
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  final String icon;
  final String title;
  final Function press;
  final bool isActive;

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _press,
      child: SizedBox(
        width: 60,
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(icon,
                height: 25,
                width: 25,
                fit: BoxFit.scaleDown,
                color:
                    isActive ? kBottomNavActiveColor : kBottomNavInactiveColor),
            const SizedBox(
              height: 5,
            ),
            Text(title,
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontFamily: 'Prompt',
                    fontWeight: isActive ? FontWeight.w500 : FontWeight.w300,
                    fontSize: 12,
                    color: isActive
                        ? kBottomNavActiveColor
                        : kBottomNavInactiveColor))
          ],
        ),
      ),
    );
  }
}
