import '../../model/product_model.dart';

abstract class ProductState {
  List<Products> products;

  ProductState(this.products);
}

class InitState extends ProductState {
  InitState(super.products);
}

class ProductLoadingState extends ProductState {
  ProductLoadingState(super.products);
}

class ProductSuccessState extends ProductState {
  ProductSuccessState({required products}) : super(products);
}
