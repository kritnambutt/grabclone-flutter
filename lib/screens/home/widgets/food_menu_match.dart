import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grabclone/cubit/menu_match_for_you/menu_match_for_you_cubit.dart';
import 'package:grabclone/cubit/menu_match_for_you/menu_match_for_you_state.dart';

import '../components/foodshop_card.dart';

class FoodMenuMatchWithYouContent extends StatefulWidget {
  const FoodMenuMatchWithYouContent({super.key});

  @override
  State<FoodMenuMatchWithYouContent> createState() =>
      _FoodMenuMatchWithYouContent();
}

class _FoodMenuMatchWithYouContent extends State<FoodMenuMatchWithYouContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<MenuMatchForYouCubit>()..getMenuMathForYou();
    });
  }

  @override
  Widget build(BuildContext context) {
    const double widthCard = 130;

    return GestureDetector(
        onTap: () {},
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      'เมนูสำหรับคุณ',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontFamily: 'Prompt', color: const Color(0xFF3D3D3D)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/right-arrow-fill.svg',
                      width: 20,
                      height: 20,
                      color: const Color(0x66808080),
                      fit: BoxFit.scaleDown,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        BlocBuilder<MenuMatchForYouCubit, MenuMatchForYouState>(
                      builder: ((context, state) {
                        if (state is LoadingMenuMatchForYou) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is ErrorMenuMatchForYou) {
                          return Center(
                            child: Icon(Icons.close),
                          );
                        } else if (state is LoadedSuccessMenuMatchForYou) {
                          final listData = state.listData;

                          return Row(
                              children: List.generate(
                                  listData.length,
                                  (index) => FoodShopCard(
                                        widthCard: widthCard,
                                        imageSrc: listData[index].imageSrc,
                                        menuName: listData[index].menuName,
                                        shopName: listData[index].shop['name'],
                                        price: listData[index].price,
                                        promotion: listData[index].promotion,
                                        press: listData[index].press,
                                      )));
                        } else {
                          return Container();
                        }
                      }),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
            ]));
  }
}
