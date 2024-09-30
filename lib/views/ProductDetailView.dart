import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_api/blocs/bloc/ProductDetailsCubit.dart';
import 'package:mvc_api/blocs/states/ProductIdState.dart';
import 'package:mvc_api/services/api_service.dart';
import 'package:mvc_api/viewmodels/ProductIdViewModel.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatelessWidget {
  final String productId; // Product ID to fetch

  const ProductDetailView({required this.productId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductdetailsCubit(ApiService())..fetchProductById(productId), // Fetch product by ID
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
        ),
        body: BlocConsumer<ProductdetailsCubit, ProductIdState>(
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error!)),
              );
            }
          },
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(
                child: Text(state.error!),
              );
            }

            final product = state.product;

            if (product == null) {
              return const Center(
                child: Text('No product found'),
              );
            }

            // Display the product details
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name: ${product.name}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  if (product.data != null) ...[
                    Text('Color: ${product.data?.color ?? "N/A"}'),
                    Text('Capacity: ${product.data?.capacity ?? "N/A"}'),
                    if (product.data?.price != null)
                      Text('Price: \$${product.data!.price!.toStringAsFixed(2)}'),
                  ] else
                    const Text('No additional data available'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
