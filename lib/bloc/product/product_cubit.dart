import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:par_interview/bloc/auth/login_cubit.dart';

import 'package:par_interview/bloc/product/product_state.dart';
import 'package:par_interview/model/product_model.dart';

class ProductCubit extends Cubit<ProductState> {
  final int pageSize = 10;

  ProductCubit() : super(ProductInitialState());

  Future<List<ProductModel>?> fetchProducts(int page) async {
    emit(ProductLoadingState());
    String apiUrl = "https://api.escuelajs.co/api/v1/products";
    try {
      final response = await dio.get(
        apiUrl,
        queryParameters: {
          'offset': (page - 1) * pageSize,
          'limit': pageSize,
        },
      );

      if (response.statusCode == 200) {
        final List<ProductModel> products = List<ProductModel>.from(
          response.data.map(
            (e) => ProductModel.fromJson(e),
          ),
        ).toList();
        emit(ProductLoadedState(products));
        return null;
      } else {
        emit(ProductErrorState('Failed to fetch products'));
      }
    } on DioException catch (e) {
      emit(ProductErrorState('Error: ${e.message}'));
    } catch (e) {
      emit(ProductErrorState('Error: $e'));
    }
    return null;
  }
}
