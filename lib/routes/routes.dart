part of routes_lib;

class AppRoutes {
  late final router = GoRouter(
    routes: [
      GoRoute(
        name: RouteName.splashScreen.name,
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        name: RouteName.onboardingScreen.name,
        path: '/onboarding',
        builder: (context, state) => OnBoardingScreen(),
      ),
      GoRoute(
        name: RouteName.landingAuthScreen.name,
        path: '/landing_auth',
        builder: (context, state) => LandingAuthScreen(),
      ),
      GoRoute(
        name: RouteName.loginScreen.name,
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        name: RouteName.homeScreen.name,
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );

  AppRoutes init() {
    return this;
  }
}
