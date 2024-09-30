import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_api/blocs/bloc/LoginBloc.dart';
import 'package:mvc_api/blocs/bloc/ProductCubit.dart';
import 'package:mvc_api/services/api_service.dart';
import 'package:mvc_api/views/ProductListView.dart';

import 'views/LoginView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(apiService),
        ),
        BlocProvider<ProductCubit>(  // Add ProductCubit here
          create: (context) => ProductCubit(apiService),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginView(),  // Your login screen
        routes: {
          '/product-list': (context) => ProductListView(),  // Example route for ProductListView
        },
      ),
    );
  }
}


