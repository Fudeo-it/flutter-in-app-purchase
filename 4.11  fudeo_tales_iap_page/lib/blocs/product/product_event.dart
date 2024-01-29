part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class FetchProductEvent extends ProductEvent {
  final Set<String> ids;

  const FetchProductEvent([this.ids = const {}]);

  @override
  List<Object?> get props => [ids];
}

class BuyProductEvent extends ProductEvent {
  final ProductDetails product;
  final bool consumable;

  const BuyProductEvent(
    this.product, {
    required this.consumable,
  });

  @override
  List<Object?> get props => [
        product,
        consumable,
      ];
}
