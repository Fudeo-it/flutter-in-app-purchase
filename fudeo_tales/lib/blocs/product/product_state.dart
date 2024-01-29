part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class InitialProductState extends ProductState {
  const InitialProductState();
}

class FetchingProductState extends ProductState {
  const FetchingProductState();
}

class FetchedProductState extends ProductState {
  final List<ProductDetails> products;

  const FetchedProductState(this.products);

  @override
  List<Object> get props => [products];
}

class NoProductState extends ProductState {
  const NoProductState();
}

class ErrorFetchingProductState extends ProductState {
  final dynamic error;

  const ErrorFetchingProductState(this.error);

  @override
  List<Object> get props => [error];
}

class BuyingProductState extends ProductState {
  const BuyingProductState();
}

class BoughtProductState extends ProductState {
  final ProductDetails product;

  const BoughtProductState(this.product);

  @override
  List<Object> get props => [product];
}

class ErrorBuyingProductState extends ProductState {
  final dynamic error;

  const ErrorBuyingProductState(this.error);

  @override
  List<Object> get props => [error];
}