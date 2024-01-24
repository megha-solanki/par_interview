import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/product_model.dart';

class ProductRepository {
  Dio dio = Dio();

  Future<List<Products>> fetchProducts(int page, int limit) async {
    String API_URL = "https://api.escuelajs.co/api/v1/products";
    List<Products> products = [];
    Map<String, dynamic> params = {"offset": '$page', "limit": "$limit"};
    print(params.values);
    try {
      Response response = await dio.get(API_URL, queryParameters: params);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        products = data.map((e) => Products.fromJson(e)).toList();
        print(products.length);
        return products;
      } else {
        return products;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return products;
  }
}
