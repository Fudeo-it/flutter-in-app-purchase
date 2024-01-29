import 'package:in_app_purchase/in_app_purchase.dart';

extension PurchaseStatusExtensions on PurchaseDetails {
  bool get paidPurchase =>
      PurchaseStatus.purchased == status || PurchaseStatus.restored == status;
}
