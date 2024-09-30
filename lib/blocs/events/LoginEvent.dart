
import '../../models/user_model.dart';

abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final UserModel user;

  LoginSubmitted(this.user);
}
