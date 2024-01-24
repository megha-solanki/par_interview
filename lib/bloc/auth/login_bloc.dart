import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/login_api.dart';
import 'login_event.dart';
import 'login_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
  }

  void _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthInitial());

    try {
      final result = await authRepository.login(event.username, event.password);

      if (result != null) {
        emit(AuthSuccess(authModel: result));
      } else {
        emit(AuthFailure('Invalid Credential'));
      }
    } catch (e) {
      print(e);
      emit(AuthFailure('Something went wrong'));
    }
  }
}
