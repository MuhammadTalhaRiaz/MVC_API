


import 'package:mvc_api/models/data_model.dart';

class ProductState {
  final List<Product> products;
  final bool loading;
  final String? error;

  ProductState({this.products = const [], this.loading = false, this.error});
}