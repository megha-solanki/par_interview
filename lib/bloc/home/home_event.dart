import 'package:dio/dio.dart';

abstract class UploadEvent {
  const UploadEvent();
}

class FileUploadEvent extends UploadEvent {
  final FormData formData;

  FileUploadEvent({required this.formData});
}
