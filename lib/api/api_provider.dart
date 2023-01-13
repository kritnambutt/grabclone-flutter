import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider();

  String enPoint = 'http://localhost:8080';

  Future<http.Response> getLastFoodOrder() async {
    final url = Uri.parse('$enPoint/api/shop_food');
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=utf-8'
    };

    return await http.get(url, headers: header);
  }
}
