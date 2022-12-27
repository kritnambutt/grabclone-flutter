import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grabclone/widgets/bottom_nav_bar.dart';

import 'components/advertise_card.dart';
import 'widgets/category_services.dart';
import 'widgets/celebrate_tenyears.dart';
import 'widgets/deal_food.dart';
import 'widgets/food_menu_match.dart';
import 'widgets/food_order_morning.dart';
import 'widgets/foodshop_may_like.dart';
import 'widgets/header.dart';
import 'widgets/lastorder_food.dart';
import 'widgets/mission_achieve_reward.dart';
import 'widgets/other_services.dart';
import 'widgets/promotion_may_interest.dart';
import 'widgets/summary_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F5EFF),
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFF0F5EFF),
            statusBarBrightness: Brightness.light,
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                HeaderContent(),
                SizedBox(
                  height: 15,
                ),
                CategoryServices(),
                SizedBox(
                  height: 15,
                ),
                SummaryContent(),
                SizedBox(
                  height: 20,
                ),
                AdvertiserCard(
                  headerTitle: 'สั่งเลย เพียง 199.-',
                  image:
                      'assets/images/illustrations/advertise/advertise-1.png',
                  title: "ความค้มอีกขั้น กับ GrabUnlimited แพ็กเกจ",
                  description: 'สนับสนุนโดย GrabFood',
                ),
                LastOrderFoodContent(),
                AdvertiserCard(
                  headerTitle: 'หมุนเลย!',
                  image:
                      'assets/images/illustrations/advertise/advertise-2.png',
                  title: "🎡 วงล้อมหัศจรรย์ แจกรางวัลใหญ่เพียง 7 วัน!",
                  description: 'สนับสนุนโดย GrabRewards',
                ),
                SizedBox(
                  height: 10,
                ),
                FoodShopMayBeYouLikeContent(),
                FoodOrderMorningContent(),
                FoodMenuMatchWithYouContent(),
                DealFoodContent(),
                PromotionMayLikeContent(),
                MissionAchieveRewardContent(),
                OtherServicesContent(),
                CelebrateTenYearsContents(),
              ]),
        ));
  }
}
