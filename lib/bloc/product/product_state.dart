abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<dynamic> products;

  ProductLoadedState(this.products);
}

class ProductErrorState extends ProductState {
  final String error;

  ProductErrorState(this.error);
}