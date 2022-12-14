import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/components/horizontal_line.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xFF13BF61),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: statusBarHeight,
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: IconButton(
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: (size.height - statusBarHeight) / 2 - 60,
                width: size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Image.asset('assets/images/logo/grab_logo_white.png',
                          height: 50),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'แอปฯ ที่ตอบทุกโจทย์ในชีวิตประจำวัน \nของคุณ',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Prompt',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(children: <Widget>[
                  ButtonRoundWithIcon(
                    textButton: 'ดำเนินการต่อด้วย Facebook',
                    imageSrc: 'assets/icons/facebook.svg',
                    press: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonRoundWithIcon(
                    textButton: 'ดำเนินการต่อด้วย Google',
                    imageSrc: 'assets/icons/google.svg',
                    press: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonRoundWithIcon(
                    textButton: 'ดำเนินการต่อด้วย Apple',
                    imageSrc: 'assets/icons/apple-logo.svg',
                    press: () {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const HorizontalLine(
                        width: 120,
                      ),
                      Text('หรือ',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  color: Colors.white,
                                  fontFamily: 'Prompt',
                                  fontSize: 16)),
                      const HorizontalLine(
                        width: 120,
                        lineColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonRoundWithIcon(
                    textButton: 'ดำเนินการต่อด้วยเบอร์โทรศัพท์',
                    imageSrc: 'assets/icons/phone-call.svg',
                    press: () {},
                  ),
                ]),
              )
            ]),
      ),
    );
  }
}

class ButtonRoundWithIcon extends StatelessWidget {
  const ButtonRoundWithIcon({
    Key? key,
    required this.textButton,
    required this.imageSrc,
    required this.press,
  }) : super(key: key);

  final String textButton;
  final String imageSrc;
  final Function press;

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
            height: 50,
            width: size.width - (25 * 2),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: _press,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          imageSrc,
                          width: 20,
                          height: 20,
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: size.width - (25 * 2) - 70,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              textButton,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                      color: const Color(0xFF1F1F1F),
                                      fontFamily: 'Prompt',
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      ],
                    )))));
  }
}
