part of 'available_purchase_cubit.dart';

abstract class AvailablePurchaseState extends Equatable {
  const AvailablePurchaseState();

  @override
  List<Object> get props => [];
}

class FetchingAvailablePurchaseState extends AvailablePurchaseState {
  const FetchingAvailablePurchaseState();
}

class FetchedAvailablePurchaseState extends AvailablePurchaseState {
  final List<PurchaseDetails> purchases;

  const FetchedAvailablePurchaseState(this.purchases);

  @override
  List<Object> get props => [purchases];
}

class NoAvailablePurchaseState extends AvailablePurchaseState {
  const NoAvailablePurchaseState();
}

class ErrorFetchingAvailablePurchaseState extends AvailablePurchaseState {
  final dynamic error;

  const ErrorFetchingAvailablePurchaseState(this.error);

  @override
  List<Object> get props => [error];
}