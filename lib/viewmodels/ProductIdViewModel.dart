import 'package:flutter/material.dart';
import 'package:mvc_api/blocs/bloc/ProductDetailsCubit.dart';
import 'package:mvc_api/models/data_model.dart';
import 'package:mvc_api/services/api_service.dart';


class ProductIdViewModel extends ChangeNotifier {
  final ProductdetailsCubit productdetailsCubit;

  ProductIdViewModel(this.productdetailsCubit);

  // Method to fetch product details by ID
  Future<void> fetchProductById(String id) async {
    await productdetailsCubit.fetchProductById(id);
    notifyListeners();
  }

  // Getter to access the product details from cubit state
  Product? get product => productdetailsCubit.state.product;
  bool get loading => productdetailsCubit.state.loading;
  String? get error => productdetailsCubit.state.error;
}
