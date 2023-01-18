import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:grabclone/cubit/food_order_morning/food_order_morning_cubit.dart';
import 'package:grabclone/cubit/foodshop_may_like/foodshop_may_like_cubit.dart';
import 'package:grabclone/cubit/global_cubit.dart';
import 'package:grabclone/cubit/last_order_food/last_order_food_cubit.dart';
import 'package:grabclone/cubit/menu_match_for_you/menu_match_for_you_cubit.dart';
import 'package:grabclone/screens/auth/landing_auth.dart';
import 'package:grabclone/screens/auth/login_screen.dart';
import 'package:grabclone/screens/home/home_screen.dart';
import 'package:grabclone/screens/onboarding/onboarding_screen.dart';
import 'package:grabclone/screens/splash_screen.dart';
import 'package:grabclone/constants.dart';
import 'package:get_it/get_it.dart';

import 'services/location_service.dart';

GetIt ourGetIt = GetIt.instance;

setupServiceLocation() {
  ourGetIt.registerLazySingleton<LocationServiceClass>(() => LocationService());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  setupServiceLocation();

  runApp(const GrabCloneApp());
}

class GrabCloneApp extends StatefulWidget {
  const GrabCloneApp({super.key});

  @override
  State<GrabCloneApp> createState() => _GrabCloneAppState();
}

class _GrabCloneAppState extends State<GrabCloneApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GlobalCubit()),
        BlocProvider(create: (_) => LastOrderFoodCubit()),
        BlocProvider(create: (_) => FoodShopMayLikeCubit()),
        BlocProvider(create: (_) => FoodOrderMorningCubit()),
        BlocProvider(create: (_) => MenuMatchForYouCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: Theme.of(context).textTheme.apply(
                displayColor: kTextColor,
              ),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0),
        ),
        // home: const SplashScreen()
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnBoardingScreen(),
      ),
      GoRoute(
        path: '/landing_auth',
        builder: (context, state) => LandingAuthScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
