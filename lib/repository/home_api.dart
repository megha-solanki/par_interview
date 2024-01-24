import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:par_interview/model/auth_model.dart';
import 'package:par_interview/model/home_model.dart';
import 'package:par_interview/model/home_model.dart';
import 'package:par_interview/model/home_model.dart';

class HomeRepository {
  Dio dio = Dio();
  static const String API_URL = 'https://api.escuelajs.co/api/v1/files/upload';

  Future<FileModel?> uploadFile({required FormData data}) async {
    FileModel? fileModel;
    try {
      final response = await dio.post(
        API_URL,
        data: data,
      );

      if (response.statusCode == 201) {
        var data = response.data;
        fileModel = FileModel.fromJson(data);
        Fluttertoast.showToast(msg: 'File Uploaded successfully!');
        return fileModel;
      } else {
        return fileModel;
      }
    } catch (e) {
      print(e);
      return fileModel;
    }
  }
}
