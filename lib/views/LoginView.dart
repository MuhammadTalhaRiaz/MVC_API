import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_api/blocs/states/LoginState.dart';
import 'package:mvc_api/viewmodels/LoginViewModel.dart';
import 'package:mvc_api/views/ProductListView.dart';

import '../blocs/bloc/LoginBloc.dart';
class LoginView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final viewModel = LoginViewModel(loginBloc);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login Successful')),
                  );
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ProductListView()));
                  // Navigate to another screen if needed
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    viewModel.login(
                      "eve.holt@reqres.in",
                      "cityslicka",
                    );
                  },
                  child: Text('Login'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
