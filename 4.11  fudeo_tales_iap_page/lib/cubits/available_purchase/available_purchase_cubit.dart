import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_tales/repositories/in_app_purchase_repository.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'available_purchase_state.dart';

class AvailablePurchaseCubit extends Cubit<AvailablePurchaseState> {
  final InAppPurchaseRepository iapRepository;
  late StreamSubscription<List<PurchaseDetails>> _purchasesSubscription;

  AvailablePurchaseCubit({
    required this.iapRepository,
  }) : super(const FetchingAvailablePurchaseState()) {
    _purchasesSubscription = iapRepository.purchases.listen(
      (purchases) => emit(purchases.isEmpty
          ? const NoAvailablePurchaseState()
          : FetchedAvailablePurchaseState(purchases)),
      onError: (error) => emit(ErrorFetchingAvailablePurchaseState(error)),
    );
  }

  @override
  Future<void> close() async {
    await _purchasesSubscription.cancel();

    return super.close();
  }
}
