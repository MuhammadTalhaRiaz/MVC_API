// views/product_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_api/blocs/bloc/ProductCubit.dart';
import 'package:mvc_api/viewmodels/ProductViewModel.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductViewModel(context.read<ProductCubit>()),
      child: Scaffold(
        appBar: AppBar(title: Text('Product List')),
        body: Consumer<ProductViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (viewModel.error != null) {
              return Center(child: Text(viewModel.error!));
            } else {
              return ListView.builder(
                itemCount: viewModel.products.length,
                itemBuilder: (context, index) {
                  final product = viewModel.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('Color: ${product.data?.color}, Capacity: ${product.data?.capacity}'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
