import 'package:flutter/material.dart';
import 'package:my_app/models/Category.dart';

import '../components/category_service_card.dart';

class CategoryServices extends StatelessWidget {
  const CategoryServices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: List.generate(
                category_services.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CategoryServiceCard(
                    imageSrc: category_services[index].icon,
                    title: category_services[index].title,
                    press: () {},
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: <Widget>[
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                  color: const Color(0xFFE8E8E8),
                  borderRadius: BorderRadius.circular(6)),
            ),
            Container(
              width: 15,
              height: 5,
              decoration: BoxDecoration(
                  color: const Color(0xFF005238),
                  borderRadius: BorderRadius.circular(6)),
            ),
          ],
        )
      ],
    );
  }
}
