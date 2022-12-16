import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/constants.dart';

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
                    boxShadow: [
                      BoxShadow(
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
