class MissionAchieveReward {
  final String imageSrc, title, dueDate;
  final Function press;

  MissionAchieveReward(
      {required this.imageSrc,
      required this.title,
      required this.dueDate,
      required this.press});
}

List<MissionAchieveReward> mission_achieve_reward_data = [
  MissionAchieveReward(
      imageSrc:
          'assets/images/illustrations/mission-achieve-reward/mission-achieve-reward-1.png',
      title: 'ชิงรางวัล [Self Pick-Up] 25%* off',
      dueDate: '31 ธ.ค. 2565',
      press: () {}),
  MissionAchieveReward(
      imageSrc:
          'assets/images/illustrations/mission-achieve-reward/mission-achieve-reward-1.png',
      title: 'ชิงรางวัล THB200 off GrabFood!',
      dueDate: '31 ธ.ค. 2565',
      press: () {}),
  MissionAchieveReward(
      imageSrc:
          'assets/images/illustrations/mission-achieve-reward/mission-achieve-reward-1.png',
      title: 'ชิงรางวัล [#Grab ThumbsUp x MICHELIN]',
      dueDate: '31 ธ.ค. 2565',
      press: () {}),
];
