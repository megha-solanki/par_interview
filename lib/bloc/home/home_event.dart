import 'package:flutter/material.dart';

@immutable
abstract class HomeState {}

class HomeScreenInitial extends HomeState {}

class HomeScreenLoading extends HomeState {}

class HomeScreenInProgress extends HomeState {}

class HomeScreenSuccess extends HomeState {
  final String fileName;

  HomeScreenSuccess(this.fileName);
}

class HomeScreenFailure extends HomeState {
  final String errorMessageCode;

  HomeScreenFailure(this.errorMessageCode);
}