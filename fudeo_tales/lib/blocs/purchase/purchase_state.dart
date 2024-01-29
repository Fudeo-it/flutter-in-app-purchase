part of 'purchase_bloc.dart';

abstract class PurchaseState extends Equatable {
  const PurchaseState();

  @override
  List<Object> get props => [];
}

class InitialPurchaseState extends PurchaseState {
  const InitialPurchaseState();
}

class CompletingPurchaseState extends PurchaseState {
  const CompletingPurchaseState();
}

class CompletedPurchaseState extends PurchaseState {
  final PurchaseDetails purchase;

  const CompletedPurchaseState(this.purchase);

  @override
  List<Object> get props => [purchase];
}

class ErrorCompletingPurchaseState extends PurchaseState {
  final dynamic error;

  const ErrorCompletingPurchaseState(this.error);

  @override
  List<Object> get props => [error];
}