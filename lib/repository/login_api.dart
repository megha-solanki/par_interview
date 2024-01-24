import 'package:dio/dio.dart';
import 'package:par_interview/model/auth_model.dart';

class AuthRepository {
  Dio dio = Dio();
  static const String API_URL = 'https://dummyjson.com/auth/login';

  Future<AuthModel?> login(String username, String password) async {
    AuthModel? authModel;
    print(username + password);
    try {
      final response = await dio.post(
        API_URL,
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        var data = response.data;
        authModel = AuthModel.fromJson(data);
        return authModel;
      } else {
        return authModel;
      }
    } catch (e) {
      print(e);
      return authModel;
    }
  }
}
