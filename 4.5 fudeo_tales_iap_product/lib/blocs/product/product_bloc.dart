import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_tales/repositories/in_app_purchase_repository.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final InAppPurchaseRepository iapRepository;

  ProductBloc({
    required this.iapRepository,
  }) : super(const InitialProductState()) {
    on<FetchProductEvent>(_onFetch);
    on<BuyProductEvent>(_onBuy);
  }

  void buy(
    ProductDetails product, {
    bool consumable = false,
  }) =>
      add(BuyProductEvent(
        product,
        consumable: consumable,
      ));

  void fetch([Set<String> ids = const {}]) => add(FetchProductEvent(ids));

  void _onFetch(FetchProductEvent event, Emitter<ProductState> emit) async {
    emit(const FetchingProductState());

    try {
      final products = await iapRepository.products(event.ids);
      emit(products.isEmpty
          ? const NoProductState()
          : FetchedProductState(products));
    } catch (error) {
      emit(ErrorFetchingProductState(error));
    }
  }

  void _onBuy(BuyProductEvent event, Emitter<ProductState> emit) async {
    emit(const BuyingProductState());

    try {
      await iapRepository.buy(event.product, consumable: event.consumable);
      emit(BoughtProductState(event.product));
    } catch (error) {
      emit(ErrorBuyingProductState(error));
    }
  }
}
