import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grabclone/cubit/foodshop_may_like/foodshop_may_like_cubit.dart';
import 'package:grabclone/cubit/global_cubit.dart';
import 'package:grabclone/cubit/last_order_food/last_order_food_cubit.dart';
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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GlobalCubit()),
        BlocProvider(create: (_) => LastOrderFoodCubit()),
        BlocProvider(create: (_) => FoodShopMayLikeCubit()),
      ],
      child: MaterialApp(
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
          home: const SplashScreen()),
    );
  }
}

class _WidgetBottomNavigationBar extends StatefulWidget {
  const _WidgetBottomNavigationBar({super.key});

  @override
  State<_WidgetBottomNavigationBar> createState() =>
      WidgetBottomNavigationBarState();
}

class WidgetBottomNavigationBarState extends State<_WidgetBottomNavigationBar> {
  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.menu),
    Icon(Icons.person)
  ];

  void _onItemTapped(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Menu', icon: Icon(Icons.menu)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
