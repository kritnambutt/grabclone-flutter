import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart';
import 'package:my_app/constants.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Account Settings",
            style:
                Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18),
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFFEF5036)),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'Back Screen'),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Badge(
                      position: BadgePosition.topEnd(top: 0, end: -12),
                      animationDuration: const Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: const Text('78',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      child: const Icon(
                        Icons.question_answer_outlined,
                        color: Color(0xFFEF5036),
                      ),
                    ))),
          ],
        ),
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(50),
        //   child: Container(
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(13),
        //         // ignore: prefer_const_literals_to_create_immutables
        //         boxShadow: [
        //           const BoxShadow(
        //               offset: Offset(0, 17),
        //               blurRadius: 23,
        //               spreadRadius: -13,
        //               color: kShadowColor)
        //         ]),
        //     child: Padding(
        //       padding: EdgeInsets.only(top: statusBarHeight + 15),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: <Widget>[
        //           const Text('Back'),
        //           Text(
        //             'Account Settings',
        //             style: Theme.of(context).textTheme.titleMedium?.copyWith(
        //                 fontWeight: FontWeight.w700,
        //                 fontSize: 18,
        //                 color: Colors.grey[900]),
        //           ),
        //           const Text('Actions'),
        //         ],
        //       ),
        //     ),
        //   ),
        //   // title: const Text('Account Settings'),
        //   // actions: [
        //   //   // IconButton(
        //   //   //   icon: const Icon(Icons.question_answer_outlined),
        //   //   //   onPressed: () {},
        //   //   //   tooltip: 'Saved Suggestions',
        //   //   // ),
        //   //   Badge(
        //   //     badgeContent: const Text('3'),
        //   //     child: const Icon(Icons.question_answer_outlined),
        //   //   )
        //   // ],
        // ),
        body: Stack(children: <Widget>[
          Stack(children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                      MyAccountGroupMenu(),
                      SettingsGroupMenu(),
                      SupportGroupMenu(),
                      SwitchAccountButton(),
                      LogoutButton(),
                      SizedBox(
                        height: 20,
                      )
                    ]))),
          ])
        ]));
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.grey[900],
            side: const BorderSide(width: 1, color: Colors.grey),
            minimumSize: Size(size.width, 50),
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text("Log Out")),
    );
  }
}

class SwitchAccountButton extends StatelessWidget {
  const SwitchAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.grey[900],
            side: const BorderSide(width: 1, color: Colors.grey),
            minimumSize: Size(size.width, 50),
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text("Switch Account")),
    );
  }
}

class SupportGroupMenu extends StatelessWidget {
  const SupportGroupMenu({super.key});

  final List<String> supportMenuList = const [
    "Help Centre",
    "Tips and Tricks",
    "Community Rules",
    "<MY_APP> Policies",
    "Happy with <MY_APP>? Rate us!",
    "About",
    "Request Account Deletion"
  ];

  @override
  Widget build(BuildContext context) {
    return GroupMenu(groupTitle: "Support", menuList: supportMenuList);
  }
}

class SettingsGroupMenu extends StatelessWidget {
  const SettingsGroupMenu({super.key});

  final List<String> settingsMenuList = const [
    "Chat Settings",
    "Notification Settings",
    "Privacy Settings",
    "Blocked Users",
    "Language / ภาษา",
  ];

  @override
  Widget build(BuildContext context) {
    return GroupMenu(groupTitle: "Settings", menuList: settingsMenuList);
  }
}

class MyAccountGroupMenu extends StatelessWidget {
  const MyAccountGroupMenu({super.key});

  final List<String> myAccountMenuList = const [
    "Account & Security",
    "My Addresses",
    "Bank Account / Cards",
  ];

  @override
  Widget build(BuildContext context) {
    return GroupMenu(groupTitle: "My Account", menuList: myAccountMenuList);
  }
}

class GroupMenu extends StatelessWidget {
  const GroupMenu({
    Key? key,
    required this.groupTitle,
    required this.menuList,
  }) : super(key: key);

  final String groupTitle;
  final List<String> menuList;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: <Widget>[
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Text(
          groupTitle,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.grey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            for (var item in menuList)
              SettingMenuItem(
                title: item,
                press: () {},
              )
          ],
        ),
      ),
    ]);
  }
}

class SettingMenuItem extends StatelessWidget {
  const SettingMenuItem({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final Function press;

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor))),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _press,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(title),
                    ),
                    SvgPicture.asset('assets/icons/next.svg',
                        height: 16, width: 16, fit: BoxFit.scaleDown),
                  ]),
            ),
          ),
        ));
  }
}
