class CelebrateTenYearsCardModel {
  final String imageSrc, title, description;
  final Function press;

  CelebrateTenYearsCardModel(
      {required this.imageSrc,
      required this.title,
      required this.description,
      required this.press});
}

List<CelebrateTenYearsCardModel> celebrate_ten_years_data = [
  CelebrateTenYearsCardModel(
    imageSrc:
        'assets/images/illustrations/celebrate-tenyears/celebrate-ten-years-1.png',
    title: 'ลดคุ้มจัดเต็มทุกบริการ',
    description: 'ใส่รหัส: GUBONUS',
    press: () {},
  ),
  CelebrateTenYearsCardModel(
    imageSrc:
        'assets/images/illustrations/celebrate-tenyears/celebrate-ten-years-2.png',
    title: 'แจกโค้ดรวม 100 ล้านบาท',
    description: 'เฉพาะผู้ใช้ GrabUnlimited',
    press: () {},
  ),
  CelebrateTenYearsCardModel(
    imageSrc:
        'assets/images/illustrations/celebrate-tenyears/celebrate-ten-years-3.png',
    title: 'ใส่รหัส \'GTU20\' ลดเพิ่มอีก 20%',
    description: '#GrabThumbsUp',
    press: () {},
  ),
  CelebrateTenYearsCardModel(
    imageSrc:
        'assets/images/illustrations/celebrate-tenyears/celebrate-ten-years-4.png',
    title: 'สองแบรนด์ดัง ลดปังฟ้าผ่า',
    description: 'ใส่รหัส: GUBONUS',
    press: () {},
  ),
];
