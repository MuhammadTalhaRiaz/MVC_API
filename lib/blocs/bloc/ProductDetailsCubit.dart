import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_api/blocs/states/ProductIdState.dart';
import 'package:mvc_api/services/api_service.dart';

class ProductdetailsCubit extends Cubit<ProductIdState> {
  final ApiService _apiService;

  ProductdetailsCubit(this._apiService) : super(ProductIdState());

  Future<void> fetchProductById(String id) async {
    try {
      emit(state.copyWith(loading: true));
      final product = await _apiService.fetchProductById(id);
      emit(state.copyWith(product: product, loading: false));
    } catch (e) {
      emit(state.copyWith(error: 'Failed to load product: $e', loading: false));
    }
  }
}
