import 'package:flutter/material.dart';
import 'package:grabclone/screens/home/components/summary_card.dart';

class SummaryContent extends StatelessWidget {
  const SummaryContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const <Widget>[
              PocketSummaryCard(),
              SizedBox(
                width: 8,
              ),
              LastOrderSummaryCard(),
              SizedBox(
                width: 8,
              ),
              LastOrderRateSummaryCard(),
              SizedBox(
                width: 8,
              ),
              PointSummaryCard()
            ],
          ),
        ));
  }
}

class PointSummaryCard extends StatelessWidget {
  const PointSummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SummaryCard(
        icon: 'assets/icons/crown.png',
        title: 'ใช้คะแนน',
        description: '21',
        press: () {});
  }
}

class LastOrderRateSummaryCard extends StatelessWidget {
  const LastOrderRateSummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SummaryCard(
        icon: 'assets/icons/star_point.png',
        title: 'ให้คะแนน',
        description: 'KHIANG (เขียง) - ตลาดบุญอนันต์ สรงประภา',
        widthCard: 200,
        press: () {});
  }
}

class LastOrderSummaryCard extends StatelessWidget {
  const LastOrderSummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SummaryCard(
        icon: 'assets/icons/food_bag.png',
        title: 'รายการ',
        description: 'KHIANG (เขียง) - ตลาดบุญอนันต์ สรงประภา',
        widthCard: 200,
        press: () {});
  }
}

class PocketSummaryCard extends StatelessWidget {
  const PocketSummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SummaryCard(
        icon: 'assets/icons/pocket.png',
        title: 'ยอดคงเหลือ',
        description: '฿ 15.10',
        press: () {});
  }
}
