import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:par_interview/bloc/product/product_event.dart';
import 'package:par_interview/bloc/product/product_state.dart';

import '../../repository/product_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;
  bool isLoadingMore = false;
  int offset = 0;
  int pageLimit = 10;
  ScrollController scrollController = ScrollController();

  ProductBloc({required this.productRepository}) : super(InitState([])) {
    scrollController.addListener(() {
      add(LoadMoreEvent());
    });

    on<FetchProductEvent>((event, emit) async {
      emit(ProductLoadingState([]));
      await productRepository.fetchProducts(offset, pageLimit).then((products) {
        emit(ProductSuccessState(products: products));
      });
    });
    on<LoadMoreEvent>((event, emit) async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoadingMore = true;
        offset += pageLimit;
        await productRepository
            .fetchProducts(offset, pageLimit)
            .then((products) {
          if (products.isEmpty) {
            isLoadingMore = false;
          }
          emit(ProductSuccessState(products: [...state.products, ...products]));
        });
      }
    });
  }
}
