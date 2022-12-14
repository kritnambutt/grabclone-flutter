import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/auth/login_screen.dart';

class LandingAuthScreen extends StatelessWidget {
  const LandingAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipPath(
                clipper: CustomClipPath(),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: size.height * 4 / 8,
                      width: size.width,
                      color: const Color(0xFFE0FBC4),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/logo/grab_logo.png',
                                height: 50),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'แอปฯ ที่ตอบทุกโจทย์ในชีวิตประจำวัน \nของคุณ',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontFamily: 'Prompt',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                      fontSize: 18),
                            )
                          ]),
                    ),
                    Image.asset(
                        'assets/images/illustrations/grab-illustration.png')
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const ButtonLogin(),
              const SizedBox(
                height: 20,
              ),
              const SignUpLogin()
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
            height: 50,
            width: size.width - (20 * 2),
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          height: 50,
                          width: size.width,
                          child: Text(
                            'เข้าสู่ระบบ',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.white, fontFamily: 'Prompt'),
                          ),
                        ))))));
  }
}

class SignUpLogin extends StatelessWidget {
  const SignUpLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
            height: 50,
            width: size.width - (20 * 2),
            decoration: const BoxDecoration(
                color: Color(0x80CBCDCB),
                // color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 17),
                      blurRadius: 23,
                      spreadRadius: -13,
                      color: kShadowColor)
                ]),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          height: 50,
                          width: size.width,
                          child: Text(
                            'ยังไม่เคยใช้ Grap? ลงทะเบียนเลย!',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.button?.copyWith(
                                color: const Color(0xFF005238),
                                fontFamily: 'Prompt'),
                          ),
                        ))))));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(w, h * 0.7500000, w, h);
    path.cubicTo(w * 0.7488000, h * 0.8681625, w * 0.3015750, h * 1.0926750,
        w * 0.0009500, h * 0.9519625);
    path.quadraticBezierTo(w * 0.0007125, h * 0.7139719, 0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
