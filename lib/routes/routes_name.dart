part of routes_lib;

enum RouteName {
  splashScreen,
  onboardingScreen,
  landingAuthScreen,
  loginScreen,
  homeScreen
}

extension RouteNameExtensions on RouteName {
  String get name {
    switch (this) {
      case RouteName.splashScreen:
        return 'splash';
      case RouteName.onboardingScreen:
        return 'onboarding';
      case RouteName.landingAuthScreen:
        return 'landing_auth';
      case RouteName.loginScreen:
        return 'login';
      case RouteName.homeScreen:
        return 'home';
      default:
        // debug -> this not setup
        return "";
    }
  }
}
