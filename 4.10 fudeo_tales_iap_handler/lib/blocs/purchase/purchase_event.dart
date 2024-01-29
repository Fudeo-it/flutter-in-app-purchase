part of 'purchase_bloc.dart';

abstract class PurchaseEvent extends Equatable {
  const PurchaseEvent();

  @override
  List<Object?> get props => [];
}

class CompletePurchaseEvent extends PurchaseEvent {
  final PurchaseDetails purchase;

  const CompletePurchaseEvent(this.purchase);

  @override
  List<Object?> get props => [purchase];
}
