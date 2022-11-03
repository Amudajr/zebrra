import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zebrra/model/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  List<ProductsModel> _products = [];
  bool _loading = true;

  bool get loading => _loading;
  List<ProductsModel> get products => _products;

  Future<void> getProducts() async {
    try {
      _loading = true;
      notifyListeners();
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (response.statusCode == HttpStatus.ok) {
        _loading = false;
        notifyListeners();
        final data = jsonDecode(response.body);
        final allproducts = (data as List)
            .map((e) => ProductsModel.fromJson(e as Map<String, dynamic>))
            .toList();
        final seeProducts = allproducts.toList();
        _products = seeProducts;
        notifyListeners();
      } else {
        _loading = false;
        _products = [];
        notifyListeners();
      }
    } catch (error) {
      print(error);
      _loading = false;
      _products = <ProductsModel>[];
      notifyListeners();
    }
  }
}
