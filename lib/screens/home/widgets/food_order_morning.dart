import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grabclone/cubit/food_order_morning/food_order_morning_cubit.dart';
import 'package:grabclone/cubit/food_order_morning/food_order_morning_state.dart';

import '../components/shop_card.dart';

class FoodOrderMorningContent extends StatefulWidget {
  const FoodOrderMorningContent({super.key});

  @override
  State<FoodOrderMorningContent> createState() => _FoodOrderMorningContent();
}

class _FoodOrderMorningContent extends State<FoodOrderMorningContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<FoodOrderMorningCubit>()..getFoodOrderMorning();
    });
  }

  @override
  Widget build(BuildContext context) {
    const double widthCard = 130;

    return GestureDetector(
        onTap: () {},
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Text(
                  'สั่งมื้อเช้าจาก',
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
                    BlocBuilder<FoodOrderMorningCubit, FoodOrderMorningState>(
                  builder: ((context, state) {
                    if (state is LoadingFoodOrderMorning) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ErrorFoodOrderMorning) {
                      return Center(
                        child: Icon(Icons.close),
                      );
                    } else if (state is LoadedSuccessFoodOrderMorning) {
                      final listData = state.listData;

                      return Row(
                          children: List.generate(
                              listData.length,
                              (index) => ShopCard(
                                    widthCard: widthCard,
                                    imageSrc: listData[index].imageSrc,
                                    shopName: listData[index].shopName,
                                    distance: listData[index].distance,
                                    promotions: listData[index].promotions,
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
