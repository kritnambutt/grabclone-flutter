import 'package:flutter_dotenv/flutter_dotenv.dart';

class ShopFood {
  final String imageSrc, shopName, distance;
  final Function press;
  // ignore: prefer_typing_uninitialized_variables
  final List<dynamic>? promotions;

  const ShopFood(
      {required this.imageSrc,
      required this.shopName,
      required this.distance,
      required this.press,
      this.promotions});

  factory ShopFood.fromJson(Map<String, dynamic> json) {
    return ShopFood(
      imageSrc: dotenv.get('HOST_URL') + json['profileImg'],
      shopName: json['name'],
      distance: '4.0',
      promotions: json['promotions'],
      press: () {},
    );
  }
}

List<ShopFood> recent_shop_food = [
  ShopFood(
      imageSrc: 'assets/images/illustrations/shop/shop-illustration-1.jpeg',
      shopName: 'เกี๊ยวทรงเครื่องบางทราย สาขาดอนเมือง - ถนนสรณคมน์',
      distance: '4.0',
      press: () {}),
  ShopFood(
      imageSrc: 'assets/images/illustrations/shop/shop-kfc.png',
      shopName: 'KFC (เคเอฟซี) - สรงประภา (Song Prapha)',
      distance: '2.3',
      promotions: ['ลดพิเศษกับเมนูที่ร่วมรายการ'],
      press: () {}),
  ShopFood(
      imageSrc: 'assets/images/illustrations/shop/shop-potato-corner.jpeg',
      shopName: 'Potato Corner (โปเตโต้ คอร์เนอร์) - โรบินสันศรีสมาน',
      distance: '5.2',
      promotions: ['ส่วนลดค่าจัดส่ง ฿10 เมื่อสั่งซื้อขั้นต่ำ ฿190'],
      press: () {}),
];
