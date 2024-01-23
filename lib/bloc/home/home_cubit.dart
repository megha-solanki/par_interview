import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../auth/login_cubit.dart';
import 'home_event.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeScreenInitial());

  uploadImage({required String imagePath}) async {
    emit(HomeScreenInProgress());
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(imagePath),
    });
    log("imagepath -$imagePath");
    dio.post(
      "https://api.escuelajs.co/api/v1/files/upload",
      data: formData,
      options: Options(
        validateStatus: (status) =>
        status == 200 || status == 201 || status == 500 || status == 404,
      ),
    )
        .then((value) {
      log("response -> ${value.data}");
      if (value.statusCode == 201) {
        emit(HomeScreenSuccess(value.data["filename"]));
        Fluttertoast.showToast(msg: "Image uploaded successfully");
      } else {
        emit(HomeScreenFailure(value.data.toString()));
        Fluttertoast.showToast(msg: "Error ${value.data}");
      }
    }, onError: (e) {
      emit(HomeScreenFailure(e.toString()));
      Fluttertoast.showToast(msg: "Error $e");
      log("error -> $e");
    });
  }
}