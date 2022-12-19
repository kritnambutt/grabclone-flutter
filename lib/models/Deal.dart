class DealData {
  final String imageSrc, title, description;
  final Function press;
  // ignore: prefer_typing_uninitialized_variables
  final String? promotion;

  DealData({
    required this.imageSrc,
    required this.title,
    required this.description,
    this.promotion,
    required this.press,
  });
}

List<DealData> deal_example = [
  DealData(
      imageSrc: 'assets/images/illustrations/deal-promotion/deal-1.png',
      title: 'เทนยะ (Tenya)',
      description: 'ใส่รหัส · GUBONUS',
      promotion: 'GrabUnlimited',
      press: () {}),
  DealData(
      imageSrc: 'assets/images/illustrations/deal-promotion/deal-2.png',
      title: 'เลือกจัดเซตอร่อยตามใจ',
      description: 'ใส่รหัส · GUBONUS',
      promotion: 'GrabUnlimited',
      press: () {}),
  DealData(
      imageSrc: 'assets/images/illustrations/deal-promotion/deal-3.png',
      title: 'Kumtsu (คุ้มสึ)',
      description: 'ใส่รหัส · GUBONUS',
      promotion: 'GrabUnlimited',
      press: () {}),
  DealData(
      imageSrc: 'assets/images/illustrations/deal-promotion/deal-4.png',
      title: 'Chabuton (ชาบูตง)',
      description: 'ใส่รหัส · GUBONUS',
      promotion: 'GrabUnlimited',
      press: () {}),
  DealData(
      imageSrc: 'assets/images/illustrations/deal-promotion/deal-5.png',
      title: 'Yayoi (ยาโยอิ)',
      description: 'ใส่รหัส · GUBONUS',
      promotion: 'GrabUnlimited',
      press: () {}),
  DealData(
      imageSrc: 'assets/images/illustrations/deal-promotion/deal-6.png',
      title: 'Auntie Anne\'s (อานตี๋ แอนส์)',
      description: 'ใส่รหัส · GUBONUS',
      promotion: 'GrabUnlimited',
      press: () {}),
];
