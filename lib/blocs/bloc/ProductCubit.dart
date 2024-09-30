import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_api/blocs/states/ProductState.dart';
import 'package:mvc_api/services/api_service.dart';

class ProductCubit extends Cubit<ProductState> {
  final ApiService apiService;

  ProductCubit(this.apiService) : super(ProductState());

  Future<void> fetchProducts() async {
    emit(ProductState(loading: true));

    try {
      final products = await apiService.fetchProducts();
      emit(ProductState(products: products));
    } catch (e) {
      emit(ProductState(error: e.toString()));
    }
  }
}