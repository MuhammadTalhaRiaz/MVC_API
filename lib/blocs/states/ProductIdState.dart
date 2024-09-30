import 'package:mvc_api/models/data_model.dart';

class ProductIdState {
  final Product? product;
  final bool loading;
  final String? error;

  ProductIdState({
    this.product,
    this.loading = false,
    this.error,
  });

  // To copy the current state with modifications, helpful for Cubit updates
  ProductIdState copyWith({
    Product? product,
    bool? loading,
    String? error,
  }) {
    return ProductIdState(
      product: product ?? this.product,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}
