import 'package:get/get.dart';
import 'dart:convert';
import 'package:ecommerve/strings.dart';
import 'package:http/http.dart' as http;

class FetchingController extends GetxController {
  RxList<dynamic> productlist = [].obs;
  RxBool isloading = true.obs;

  Future<void> fetchproduct() async {
    final response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        isloading.value = false;
        Map<String, dynamic> jsonData = json.decode(response.body);
        productlist.value = jsonData['products'];
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
