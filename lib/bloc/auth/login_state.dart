import 'package:par_interview/model/auth_model.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
}

class AuthLoading extends AuthState {
}

class AuthSuccess extends AuthState {
  AuthModel authModel;
  AuthSuccess({required this.authModel});
}

class AuthFailure extends AuthState {
  String message;
  AuthFailure(this.message);
}