import 'package:flutter/material.dart';
import 'package:mvc_api/blocs/bloc/ProductCubit.dart';
import 'package:mvc_api/models/data_model.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductCubit productCubit;

  ProductViewModel(this.productCubit) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    await productCubit.fetchProducts();
    notifyListeners();
  }

  List<Product> get products => productCubit.state.products;
  bool get loading => productCubit.state.loading;
  String? get error => productCubit.state.error;
}
