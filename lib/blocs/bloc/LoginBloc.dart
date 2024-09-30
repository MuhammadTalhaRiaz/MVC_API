

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_api/blocs/events/LoginEvent.dart';
import 'package:mvc_api/blocs/states/LoginState.dart';
import 'package:mvc_api/services/api_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService apiService;

  LoginBloc(this.apiService) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        // Simulating a network call
        await apiService.login(event.user);
        emit(LoginSuccess());
      } catch (error) {
        emit(LoginFailure(error:error.toString()));
      }
    });
  }
}
