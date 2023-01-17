import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grabclone/cubit/last_order_food/last_order_food_cubit.dart';
import 'package:grabclone/cubit/last_order_food/last_order_food_state.dart';

import '../components/shop_card.dart';

class LastOrderFoodContent extends StatefulWidget {
  const LastOrderFoodContent({super.key});

  @override
  State<LastOrderFoodContent> createState() => _LastOrderFoodContent();
}

class _LastOrderFoodContent extends State<LastOrderFoodContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<LastOrderFoodCubit>()..getLastOrderFood();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      'ร้านที่คุณเคยสั่ง',
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
                    child: BlocBuilder<LastOrderFoodCubit, LastOrderFoodState>(
                      builder: ((context, state) {
                        if (state is LoadingLastOrderFood) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is ErrorLastOrderFood) {
                          return Center(
                            child: Icon(Icons.close),
                          );
                        } else if (state is LoadedSuccessLastOrderFood) {
                          final listData = state.listData;

                          return Row(
                              children: List.generate(
                                  listData.length,
                                  (index) => ShopCard(
                                        imageSrc: listData[index].imageSrc,
                                        shopName: listData[index].shopName,
                                        distance: listData[index].distance,
                                        promotions: listData[index].promotions,
                                        press: listData[index].press,
                                        showPromotions: false,
                                      )));
                        } else {
                          return Container();
                        }
                      }),
                    ),
                  )),
              const SizedBox(
                height: 0,
              ),
            ]));
  }
}
