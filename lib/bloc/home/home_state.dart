import 'package:par_interview/model/auth_model.dart';
import 'package:par_interview/model/home_model.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  FileModel fileModel;
  HomeSuccess({required this.fileModel});
}

class HomeFailure extends HomeState {
  String message;
  HomeFailure(this.message);
}
