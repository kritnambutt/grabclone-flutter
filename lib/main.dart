import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:grabclone/cubit/food_order_morning/food_order_morning_cubit.dart';
import 'package:grabclone/cubit/foodshop_may_like/foodshop_may_like_cubit.dart';
import 'package:grabclone/cubit/global_cubit.dart';
import 'package:grabclone/cubit/last_order_food/last_order_food_cubit.dart';
import 'package:grabclone/cubit/menu_match_for_you/menu_match_for_you_cubit.dart';
import 'package:grabclone/l10n/support_locale.dart';
import 'package:grabclone/routes/routes_lib.dart';
import 'package:grabclone/constants.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'services/location_service.dart';

GetIt ourGetIt = GetIt.instance;
Locale initialLocale = Locale('en');

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
  late GoRouter _router = AppRoutes().init().router;
  final Locale _locale = initialLocale;

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
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.support,
        locale: _locale,
        // home: const SplashScreen()
      ),
    );
  }
}
