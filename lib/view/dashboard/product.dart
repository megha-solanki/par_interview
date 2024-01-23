import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:par_interview/bloc/product/product_cubit.dart';
import 'package:par_interview/constant/color_const.dart';
import '../../bloc/product/product_state.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: const Text(
          "Product",
          style: TextStyle(color: white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: BlocProvider<ProductCubit>(
        create: (context) => ProductCubit(),
        child: BlocBuilder(
          builder: (BuildContext context, state) {
            if (state is ProductInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductLoadedState) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  );
                },
              );
            } else if (state is ProductErrorState) {
              return Center(
                child: Text('Error: ${state.error}'),
              );
            } else {
              return Container(); // Handle other states if needed
            }
          },
        ),
      ),
    );
  }
}
