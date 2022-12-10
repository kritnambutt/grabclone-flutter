import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/widgets/bottom_nav_bar.dart';
import 'package:my_app/widgets/search_bar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.45,
            decoration: const BoxDecoration(
                color: kBlueLightColor,
                image: DecorationImage(
                    image: AssetImage("assets/icons/meditation.svg"),
                    fit: BoxFit.scaleDown)),
          ),
          SafeArea(
            child: Stack(
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.35,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset('assets/icons/meditation.svg',
                        height: 150, width: 150, fit: BoxFit.scaleDown),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: size.height * 0.05),
                          Text(
                            "Meditation",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w900, fontSize: 25),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "3 - 10 MINS Course",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: size.width *
                                0.6, // it just take 60% of total width
                            child: const Text(
                                'Live happier and healthier by learning the fundamentals of mediations'),
                          ),
                          SizedBox(
                              width: size.width * 0.5,
                              child: const SearchBar()),
                          Wrap(
                            spacing: 15,
                            runSpacing: 15,
                            children: <Widget>[
                              SessionCard(
                                  sessionNum: 1, isDone: true, press: () {}),
                              SessionCard(sessionNum: 2, press: () {}),
                              SessionCard(sessionNum: 3, press: () {}),
                              SessionCard(sessionNum: 4, press: () {}),
                              SessionCard(sessionNum: 5, press: () {}),
                              SessionCard(sessionNum: 6, press: () {}),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("Meditation",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          Container(
                            height: 90,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  const BoxShadow(
                                      offset: Offset(0, 17),
                                      blurRadius: 23,
                                      spreadRadius: -13,
                                      color: kShadowColor)
                                ]),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset("assets/icons/meditation.svg",
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.scaleDown),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "Basic 2",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    const Text(
                                        "Start your deepen your practice")
                                  ],
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                      "assets/icons/lock.svg",
                                      width: 25,
                                      height: 25,
                                      fit: BoxFit.scaleDown),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final Function press;
  const SessionCard({
    Key? key,
    required this.sessionNum,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: kShadowColor)
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _press,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 43,
                      decoration: BoxDecoration(
                          color: isDone ? kBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: kBlueColor)),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Session $sessionNum',
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
