import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product_model.dart';

abstract class GetInfo {
  GetInfo._();

  static Future<List<ProductModel?>?> getProduct() async {
    try {
      final url = Uri.parse("https://fakestoreapi.com/products");
      final res = await http.get(url);
      return productModelFromJson(res.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<List> getCategory() async{
    try {
      final url = Uri.parse("https://fakestoreapi.com/products/categories");
      final res = await http.get(url);
      return jsonDecode(res.body);
    } catch (e) {
      print(e);
    }
    return [];
  }

  static Future<List<ProductModel?>?> getProductByCategory(String categoryTitle) async {
    try {
      final url = Uri.parse("https://fakestoreapi.com/products/category/$categoryTitle");
      final res = await http.get(url);
      return productModelFromJson(res.body);
    } catch (e) {
      print(e);
    }
    return null;
  }
}