import 'package:flutter/material.dart';

import '../../../models/MissionReward.dart';
import '../components/mission_achieve_reward_card.dart';

class MissionAchieveRewardContent extends StatelessWidget {
  const MissionAchieveRewardContent({
    Key? key,
  }) : super(key: key);

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
                      'ทำภารกิจพิชิตรีวอร์ด',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontFamily: 'Prompt', color: const Color(0xFF3D3D3D)),
                    ),
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
                      child: Row(
                          children: List.generate(
                              mission_achieve_reward_data.length, (index) {
                        var dataIndex = mission_achieve_reward_data[index];

                        return MissionAchieveRewardCard(
                          imageSrc: dataIndex.imageSrc,
                          title: dataIndex.title,
                          dueDate: dataIndex.dueDate,
                          press: dataIndex.press,
                        );
                      })))),
              const SizedBox(
                height: 30,
              ),
            ]));
  }
}
