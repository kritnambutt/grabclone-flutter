class PromotionMayInterest {
  final String imageSrc, title, service;
  final Function press;

  PromotionMayInterest(
      {required this.imageSrc,
      required this.title,
      required this.service,
      required this.press});
}

List<PromotionMayInterest> promotion_may_interest_data = [
  PromotionMayInterest(
    imageSrc: 'assets/icons/other_services/grab_unlimited.png',
    title: '[Starbucks] ฿120 Discount',
    service: 'GrabFood',
    press: () {},
  ),
  PromotionMayInterest(
    imageSrc: 'assets/icons/other_services/grab_unlimited.png',
    title: '[Dairy Queen] ฿90 Discount',
    service: 'GrabFood',
    press: () {},
  ),
  PromotionMayInterest(
    imageSrc: 'assets/icons/other_services/grab_unlimited.png',
    title: '[MC80] ลด ฿80',
    service: 'GrabFood',
    press: () {},
  ),
  PromotionMayInterest(
    imageSrc: 'assets/icons/other_services/grab_unlimited.png',
    title: '[ENJOYCTG] ส่วดลด ฿200',
    service: 'GrabFood',
    press: () {},
  ),
];
