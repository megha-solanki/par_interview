import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product/component/product_card.dart';
import '../../bloc/product/product_bloc.dart';
import '../../bloc/product/product_event.dart';
import '../../bloc/product/product_state.dart';
import '../../model/product_model.dart';
import '../../repository/product_repo.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Pagination"),
      ),
      body: BlocProvider(
        create: (context) =>
            ProductBloc(productRepository: context.read<ProductRepository>())
              ..add(FetchProductEvent()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is ProductSuccessState) {
              List<Products> products = state.products;
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.75, crossAxisCount: 2),
                  controller: context.read<ProductBloc>().scrollController,
                  itemCount: context.read<ProductBloc>().isLoadingMore
                      ? products.length + 1
                      : products.length,
                  itemBuilder: (context, index) {
                    if (index >= products.length) {
                      return const Center(child: CupertinoActivityIndicator());
                    } else {
                      return ProductCard(
                        products: products[index],
                      );
                    }
                  });
            } else {
              return const Center(child: Text("No Data"));
            }
          },
        ),
      ),
    );
  }
}
