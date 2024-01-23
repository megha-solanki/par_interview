import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

Dio dio=Dio();

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  void login(String email, String password) async {
    emit(AuthLoadingState());
    String apiUrl = "https://dummyjson.com/auth/login";
    try {
      final response = await dio.post(apiUrl,
        data: {
          'username': email,
          'password': password,
        },
      );
      log("$response");
      if (response.statusCode == 200) {
        final token = response.data['token'];
        emit(AuthSuccessState(token));
      } else {
        emit(AuthErrorState('Failed to authenticate'));
      }
    } catch (e) {
      emit(AuthErrorState('Error: $e'));
    }
  }
}