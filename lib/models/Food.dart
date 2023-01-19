import 'package:flutter_dotenv/flutter_dotenv.dart';

class MenuFoodShop {
  final String imageSrc, menuName;
  final Map<String, dynamic> shop;
  final double price;
  final Function press;
  // ignore: prefer_typing_uninitialized_variables
  final String? promotion;

  MenuFoodShop(
      {required this.imageSrc,
      required this.menuName,
      required this.shop,
      required this.price,
      required this.press,
      this.promotion});

  factory MenuFoodShop.fromJson(Map<String, dynamic> json) {
    return MenuFoodShop(
      imageSrc: dotenv.get('HOST_URL') + json['img'],
      menuName: json['name'],
      shop: json['shop'],
      price: json['price'],
      press: () {},
    );
  }
}

List<MenuFoodShop> menu_match_with_you_shop_food = [
  MenuFoodShop(
      imageSrc: 'assets/images/illustrations/menu-match/menu-match-you-1.png',
      menuName: 'บะหมี่หยกหมูทอด',
      shop: {
        "name": 'ข้าวหมูทอดน้องแอ็คชั่น (Nong Action) - ถนนช่างอากาศอุทิศ'
      },
      price: 65,
      press: () {}),
  MenuFoodShop(
      imageSrc: 'assets/images/illustrations/menu-match/menu-match-you-2.png',
      menuName: 'ข้าวสเต็กปลาลุยสวน',
      shop: {"name": 'Chester\'s (เชสเตอร์) - แฮปปี้ อเวนิว ดอนเมือง'},
      price: 169,
      promotion: 'ลดพิเศษกับเมนูที่ร่วมรายการ',
      press: () {}),
  MenuFoodShop(
      imageSrc: 'assets/images/illustrations/menu-match/menu-match-you-3.png',
      menuName: 'ข้าวผัดคะน้าขาหมูเยอรมัน',
      shop: {"name": 'ตะหลิว (Taliew) - แฮปปี้อเวนิว ดอนเมือง (ร้านเชสเตอร์)'},
      price: 110,
      promotion: 'ส่วนลดค่าจัดส่ง ฿10 เมื่อสั่งซื้อขั้นต่ำ ฿190',
      press: () {}),
];
