import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:grabclone/components/horizontal_line.dart';
import 'package:grabclone/routes/routes_lib.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool? _checking = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).padding.top;

    void _goToHomeScreen() {
      GoRouter.of(context).goNamed(RouteName.homeScreen.name);
    }

    void _login() async {
      final loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        _accessToken = loginResult.accessToken;
        final userInfo = await FacebookAuth.instance.getUserData();
        _userData = userInfo;
      } else {
        print('ResultStatus: ${loginResult.status}');
        print('Message: ${loginResult.message}');
      }
    }

    void _ifUserIsLoggedIn() async {
      final accessToken = await FacebookAuth.instance.accessToken;

      setState(() {
        _checking = false;
      });

      if (accessToken != null) {
        final userData = await FacebookAuth.instance.getUserData();
        _accessToken = accessToken;
        setState(() {
          _userData = userData;
        });
      } else {
        _login();
      }
    }

    void _logOut() async {
      await FacebookAuth.instance.logOut();
      _accessToken = null;
      _userData = null;
    }

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
                        "login_screen.header_text".tr(),
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
                    textButton: "login_screen.facebook_auth_button_text".tr(),
                    imageSrc: 'assets/icons/facebook.svg',
                    press: _ifUserIsLoggedIn,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonRoundWithIcon(
                    textButton: "login_screen.google_auth_button_text".tr(),
                    imageSrc: 'assets/icons/google.svg',
                    press: _goToHomeScreen,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonRoundWithIcon(
                    textButton: "login_screen.appleid_auth_button_text".tr(),
                    imageSrc: 'assets/icons/apple-logo.svg',
                    press: _goToHomeScreen,
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
                      Text("login_screen.divider_line_or_text".tr(),
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
                    textButton:
                        "login_screen.telephone_number_button_text".tr(),
                    imageSrc: 'assets/icons/phone-call.svg',
                    press: _goToHomeScreen,
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
