import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_tales/blocs/purchase/purchase_bloc.dart';
import 'package:fudeo_tales/cubits/available_purchase/available_purchase_cubit.dart';
import 'package:fudeo_tales/cubits/navigation_counter/navigation_counter_cubit.dart';
import 'package:fudeo_tales/cubits/subscriptions_cubit.dart';
import 'package:fudeo_tales/extensions/purchase_status_extensions.dart';
import 'package:fudeo_tales/misc/constants.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class IAPPurchaseHandler extends StatelessWidget {
  final Widget child;

  const IAPPurchaseHandler({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocListener<AvailablePurchaseCubit, AvailablePurchaseState>(
        listener: (context, state) {
          if (state is FetchedAvailablePurchaseState) {
            _shouldCompletePurchases(
              context,
              purchases: state.purchases,
            );
          }

          final purchases = switch (state) {
            FetchedAvailablePurchaseState(:final purchases) => purchases,
            _ => <PurchaseDetails>[],
          };

          _handlePurchases(context, purchases: purchases);
        },
        child: child,
      );

  void _shouldCompletePurchases(
    BuildContext context, {
    required List<PurchaseDetails> purchases,
  }) {
    for (final purchase in purchases) {
      if (PurchaseStatus.error == purchase.status && purchase.error != null) {
        _handlePurchaseError(context, purchase.error!.message);
      }

      if (purchase.pendingCompletePurchase) {
        context.read<PurchaseBloc>().complete(purchase);
      }
    }
  }

  void _handlePurchases(
    BuildContext context, {
    required List<PurchaseDetails> purchases,
  }) {
    final paidPurchases = purchases
        .where((purchase) => K.iapProducts.contains(purchase.productID))
        .where((purchase) => purchase.paidPurchase)
        .toList(growable: false);

    final shouldReset = paidPurchases.any(
        (purchase) => K.iapResettableProducts.contains(purchase.productID));

    if (shouldReset) {
      context.read<NavigationCounterCubit>().reset();
    }

    final restoredSubscriptions = paidPurchases
        .where((purchase) => PurchaseStatus.restored == purchase.status)
        .map((purchase) => purchase.productID)
        .where((productID) => productID != K.dailySubscriptionProductId)
        .toSet();

    if (restoredSubscriptions.isNotEmpty) {
      context
          .read<SubscriptionsCubit>()
          .restoreSubscriptions(restoredSubscriptions);
    }

    final nonConsumablePurchases = paidPurchases
        .where((purchase) => PurchaseStatus.purchased == purchase.status)
        .map((purchase) => purchase.productID)
        .where((productID) => K.iapNonConsumableProducts.contains(productID))
        .toSet();

    if (nonConsumablePurchases.isNotEmpty) {
      context
          .read<SubscriptionsCubit>()
          .addSubscriptions(nonConsumablePurchases);
    }
  }

  void _handlePurchaseError(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Si è verificato un errore'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}
