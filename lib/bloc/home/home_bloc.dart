import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:par_interview/repository/home_api.dart';

import '../../repository/login_api.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<UploadEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<FileUploadEvent>(_onLoginEvent);
  }

  void _onLoginEvent(FileUploadEvent event, Emitter<HomeState> emit) async {
    emit(HomeInitial());

    try {
      emit(HomeLoading());
      final result = await homeRepository.uploadFile(data: event.formData);

      if (result != null) {
        emit(HomeSuccess(fileModel: result));
      } else {
        emit(HomeFailure('Invalid Credential'));
      }
    } catch (e) {
      print(e);
      emit(HomeFailure('Something went wrong'));
    }
  }
}
