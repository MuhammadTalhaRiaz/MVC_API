import 'package:flutter/material.dart';
import 'package:mvc_api/blocs/bloc/LoginBloc.dart';
import 'package:mvc_api/blocs/events/LoginEvent.dart';
import '../blocs/states/LoginState.dart';
import '../models/user_model.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginBloc loginBloc;

  LoginViewModel(this.loginBloc) {
    // Listen to the login bloc state changes
    loginBloc.stream.listen((state) {
      if (state is LoginLoading) {
        // Handle loading state (e.g., show a loading indicator)
        print("Loading...");
      } else if (state is LoginSuccess) {
        // Handle successful login (e.g., navigate to home)
        print("Login successful!");
        notifyListeners(); // Notify listeners of state change
      } else if (state is LoginFailure) {
        // Handle login failure (e.g., show an error message)
        print("Login failed: ${state.error}");
        notifyListeners(); // Notify listeners of state change
      }
    });
  }

  void login(String username, String password) {
    final user = UserModel(email: username, password: password);
    loginBloc.add(LoginSubmitted(user));
  }
}