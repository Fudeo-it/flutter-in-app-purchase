import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_tales/repositories/in_app_purchase_repository.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'purchase_event.dart';

part 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  final InAppPurchaseRepository iapRepository;

  PurchaseBloc({
    required this.iapRepository,
  }) : super(const InitialPurchaseState()) {
    on<CompletePurchaseEvent>(_onComplete);
  }

  void complete(PurchaseDetails purchase) =>
      add(CompletePurchaseEvent(purchase));

  void _onComplete(
      CompletePurchaseEvent event, Emitter<PurchaseState> emit) async {
    emit(const CompletingPurchaseState());

    try {
      await iapRepository.complete(event.purchase);
      emit(CompletedPurchaseState(event.purchase));
    } catch (error) {
      emit(ErrorCompletingPurchaseState(error));
    }
  }
}
