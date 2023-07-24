import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Models/Category.dart';
import 'package:flutter_ecommerce/Models/Product.dart';
import 'package:flutter_ecommerce/Models/vendor_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VendorProvider with ChangeNotifier {
  List<Vendor> _vendors = [];
  bool _isLoading = false; // New property to track loading state

  List<Vendor> get vendors => _vendors;

  bool get isLoading => _isLoading; // Getter for the loading state
/*********************************************************************************************************************************************/

  List<Category> _categories = [];
  bool _isCategoryLoading = false;

  List<Category> get categories => _categories;

  bool get isCategoryLoading => _isCategoryLoading;

/*********************************************************************************************************************************************/

  List<Product> _product = [];
  bool _isProductLoading = false;

  List<Product> get products => _product;

  bool get isProductLoading => _isProductLoading;

/*********************************************************************************************************************************************/

  Future<void> fetchVendors() async {
    _isLoading = true; // Set loading state to true before fetching data
    notifyListeners();

    final String apiUrl =
        'https://basekcall.com/ShoppingApi/GetVendorListByMainCategpry';
    final Map<String, String> postData = {
      "MainCategoryId": "88",
      "latitude": "26.850000",
      "longitude": "80.949997"
    };

    try {
      // print('Calling API with body: $postData');
      final response = await http.post(Uri.parse(apiUrl), body: postData);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> data = jsonData['data'];
        _vendors = data.map((item) => Vendor.fromJson(item)).toList();
        print(' vendors - $data');
      } else {
        print('Error fetching vendors - status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching vendors: $error');
    } finally {
      _isLoading = false; // Set loading state to false after fetching data
      notifyListeners();
    }
  }

/*********************************************************************************************************************************************/

  Future<void> fetchCategoriesByVendorId(int vendorId) async {
    _isCategoryLoading = true; // Set loading state to true before fetching data
    notifyListeners();

    final String apiUrl =
        'https://webapi.basekcall.com/api/Ecommerce/GetCategoryByVendorId';
    final Map<String, String> postData = {
      "VendorId": vendorId.toString(),
    };

    try {
      final response = await http.post(Uri.parse(apiUrl), body: postData);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> data = jsonData['Data'];
        _categories = data.map((item) => Category.fromJson(item)).toList();
        print('Categories - $data');
      } else {
        print(
            'Error fetching categories - status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching categories: $error');
    } finally {
      _isCategoryLoading =
          false; // Set loading state to false after fetching data
      notifyListeners();
    }
  }

//**********************************************************************************************************************************************//
  Future<void> fetchProductsByCategoryVendorId(
      String mid, String categoryId, int vendorId) async {
    _isProductLoading = true; // Set loading state to true before fetching data
    notifyListeners();

    final String apiUrl =
        'https://basekcall.com/ShoppingApi/GetProductByCategoryVendorId';
    final Map<String, String> postData = {
      "MId": mid,
      "categoryId": categoryId,
      "VendorId": vendorId.toString(),
    };

    try {
      final response = await http.post(Uri.parse(apiUrl), body: postData);
      print('response: $postData   , $apiUrl ');
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> data = jsonData['data'];
        _product = data.map((item) => Product.fromJson(item)).toList();
        print('Categories - $data');
      } else {
        print('Error fetching products - status code: ${response.statusCode}');
        _product = []; // Set the products list to empty on error
      }
    } catch (error) {
      print('Error fetching products: $error');
      _product = []; // Set the products list to empty on error
    } finally {
      _isProductLoading =
          false; // Set loading state to false after fetching data
      notifyListeners();
    }
  }

//**********************************************************************************************************************************************//

  Future<bool> addToCart(int productId, int vendorId, int posid) async {
    final String apiUrl = 'https://basekcall.com/ShoppingApi/AddToCart';
    final Map<String, dynamic> postData = {
      "UserId": "28304",
      "TokenId": "awBwAHMAZQBNAEEAeQBZAEYAagA=",
      "ProductOptionSetId": posid.toString(),
      "ProductId": productId.toString(),
      "VendorId": vendorId.toString(),
      "Qty": "1",
      "BusinessValue": "0",
      "RedeemPoint": "0"
    };

    try {
      final response = await http.post(Uri.parse(apiUrl), body: postData);
      print('response: $postData   , $apiUrl ');
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final bool status = jsonData['LoginStatus'] ?? false;
        print('jsonData $jsonData ');
        return status;
      } else {
        print('Error adding to cart - status code: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error adding to cart: $error');
      return false;
    }
  }
}
