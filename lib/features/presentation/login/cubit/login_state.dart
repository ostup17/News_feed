import '../../../data/auth_model.dart';

abstract class LoginState {}

class LoginNotAut extends LoginState{}
class LoginLoading extends LoginState{}
class LoginLoaded extends LoginState{
  LoginLoaded({required this.authModel});
  final AuthModel authModel;
}
class LoginError extends LoginState{}

