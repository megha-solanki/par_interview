abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String token;

  AuthSuccessState(this.token);
}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
}