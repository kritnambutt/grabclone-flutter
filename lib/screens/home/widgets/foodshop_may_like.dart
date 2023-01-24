import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grabclone/cubit/foodshop_may_like/foodshop_may_like_cubit.dart';
import 'package:grabclone/cubit/foodshop_may_like/foodshop_may_like_state.dart';
import 'package:grabclone/screens/home/components/shop_card.dart';

class FoodShopMayBeYouLikeContent extends StatefulWidget {
  const FoodShopMayBeYouLikeContent({super.key});

  @override
  State<FoodShopMayBeYouLikeContent> createState() =>
      _FoodShopMayBeYouLikeContent();
}

class _FoodShopMayBeYouLikeContent extends State<FoodShopMayBeYouLikeContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<FoodShopMayLikeCubit>()..getFoodShopMayLike();
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
                      'ร้านที่คุณอาจชอบ',
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
                        BlocBuilder<FoodShopMayLikeCubit, FoodShopMayLikeState>(
                      builder: ((context, state) {
                        if (state is LoadingFoodShopMayLike) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is ErrorFoodShopMayLike) {
                          return Center(
                            child: Icon(Icons.close),
                          );
                        } else if (state is LoadedSuccessFoodShopMayLike) {
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
