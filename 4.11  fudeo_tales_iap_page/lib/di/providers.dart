part of 'dependency_injector.dart';

final List<SingleChildWidget> _providers = [
  Provider<StoryService>(
    create: (_) => const StoryService(),
  ),
  Provider<InAppPurchase>.value(
    value: InAppPurchase.instance..restorePurchases(),
  ),
];
