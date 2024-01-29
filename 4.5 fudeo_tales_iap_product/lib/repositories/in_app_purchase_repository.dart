import 'package:in_app_purchase/in_app_purchase.dart';

class InAppPurchaseRepository {
  final InAppPurchase inAppPurchase;

  const InAppPurchaseRepository({
    required this.inAppPurchase,
  });

  Stream<List<PurchaseDetails>> get purchases => inAppPurchase.purchaseStream;

  Future<List<ProductDetails>> products([Set<String> ids = const {}]) async {
    try {
      final available = await inAppPurchase.isAvailable();

      if (!available) {
        return [];
      }

      final response = await inAppPurchase.queryProductDetails(ids);
      return response.productDetails;
    } catch (error) {
      throw Error();
    }
  }

  Future<void> buy(
    ProductDetails product, {
    bool consumable = false,
  }) async {
    try {
      final purchaseParam = PurchaseParam(productDetails: product);

      if (consumable) {
        await inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
      } else {
        await inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      }
    } catch (error) {
      throw Error();
    }
  }

  Future<void> complete(PurchaseDetails purchase) async {
    try {
      await inAppPurchase.completePurchase(purchase);
    } catch (error) {
      throw Error();
    }
  }
}
