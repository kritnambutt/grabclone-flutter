import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grabclone/api/api_provider.dart';
import 'package:dio/dio.dart';

import '../../../models/Shop.dart';
import '../components/shop_card.dart';

class LastOrderFoodContent extends StatefulWidget {
  const LastOrderFoodContent({super.key});

  @override
  State<LastOrderFoodContent> createState() => _LastOrderFoodContent();
}

class _LastOrderFoodContent extends State<LastOrderFoodContent> {
  late Future<List<ShopFood>> futureShopFood;

  @override
  void initState() {
    super.initState();
    futureShopFood = fetchLastOrderFood();
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
                    child: FutureBuilder<List<ShopFood>>(
                      future: futureShopFood,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<ShopFood> shop = snapshot.data!;
                          print(shop);
                          return Row(
                              children: List.generate(
                                  shop.length,
                                  (index) => ShopCard(
                                        imageSrc: shop[index].imageSrc,
                                        shopName: shop[index].shopName,
                                        distance: shop[index].distance,
                                        promotion: shop[index].promotion,
                                        press: shop[index].press,
                                      )));
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  )),
              const SizedBox(
                height: 0,
              ),
            ]));
  }
}

Future<List<ShopFood>> fetchLastOrderFood() async {
  final ApiProvider apiProvider = ApiProvider();

  final Response res = await apiProvider.getLastFoodOrder();
  if (res.statusCode == 200) {
    List<dynamic> responseJson = res.data;
    return responseJson.map((m) => new ShopFood.fromJson(m)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
