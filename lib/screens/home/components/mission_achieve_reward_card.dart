import 'package:flutter/material.dart';

class MissionAchieveRewardCard extends StatelessWidget {
  const MissionAchieveRewardCard({
    Key? key,
    required this.imageSrc,
    required this.title,
    required this.dueDate,
    required this.press,
  }) : super(key: key);

  final String imageSrc, title, dueDate;
  final Function press;

  void _press() {
    press();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _press,
        child: Container(
          width: 300,
          height: 85,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE8E8E8)),
              borderRadius: BorderRadius.circular(6)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  imageSrc,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'Prompt',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    Text('หมดเขต $dueDate',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontFamily: 'Prompt',
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                    Text('ร่วมภารกิจนี้',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontFamily: 'Prompt',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF126FD8),
                            fontSize: 12))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
