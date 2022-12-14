import 'package:flutter/material.dart';
import 'package:my_app/screens/auth/landing_auth.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: PageView.builder(
                itemCount: onboarding_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingContent(
                    title: onboarding_data[index].title,
                    description: onboarding_data[index].description,
                    image: onboarding_data[index].imageLink,
                  );
                })),
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ...List.generate(
                  onboarding_data.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: DotIndicator(
                          isActive: index == currentPage,
                        ),
                      ))
            ],
          ),
        ),
        SizedBox(
            height: 70,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: currentPage == onboarding_data.length - 1
                  ? const GetStartedButton()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const LandingAuthScreen();
                                }));
                              },
                              child: Text('Skip',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                          color: const Color(0x99808080)))),
                          TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('Next',
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: const Color(0xFF13BF61))),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF13BF61),
                                )
                              ],
                            ),
                          )
                        ]),
            ))
      ]),
    ));
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
            height: 70,
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
                        return const LandingAuthScreen();
                      }));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          height: 50,
                          width: size.width,
                          child: Text(
                            'Get Started',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: Colors.white),
                          ),
                        ))))));
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: isActive ? 20 : 4,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: <Widget>[
          const Spacer(),
          Image.network(
            image,
            height: 250,
          ),
          const Spacer(),
          Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 16,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
          const Spacer()
        ],
      ),
    );
  }
}

class OnboardingModel {
  String title, description, imageLink;
  OnboardingModel({
    required this.title,
    required this.description,
    required this.imageLink,
  });
}

// ignore: non_constant_identifier_names
final List<OnboardingModel> onboarding_data = [
  OnboardingModel(
      title: 'Choose Product',
      description:
          'A product is the item offered for sale. A product can be a service or an item. It can be physical or in virtual or cyber form',
      imageLink: 'https://i.imgur.com/RsDdcvC.png'),
  OnboardingModel(
      title: 'Make Payment',
      description:
          'Payment is the transfer of money services in exchange product or Payments typically made terms agreed',
      imageLink: 'https://i.imgur.com/5RBw0Ll.png'),
  OnboardingModel(
      title: 'Get Your Order',
      description:
          'Business or commerce an order is a stated intention either spoken to engage in a commercial transaction specific products ',
      imageLink: 'https://i.imgur.com/KWgockc.png'),
];
