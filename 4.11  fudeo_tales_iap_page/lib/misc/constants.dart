class K {
  const K._();

  // Remove ad
  static const oneTimeSubscriptionProductId = 'one_time_subscription';

  // Reset counter
  static const dailySubscriptionProductId = 'daily_subscription';

  // Disable observer
  static const monthlySubscriptionProductId = 'monthly_subscription';

  static const iapProducts = {
    oneTimeSubscriptionProductId,
    dailySubscriptionProductId,
    monthlySubscriptionProductId,
  };

  static const iapNonConsumableProducts = {
    oneTimeSubscriptionProductId,
    monthlySubscriptionProductId,
  };

  static const iapResettableProducts = {
    dailySubscriptionProductId,
    monthlySubscriptionProductId,
  };

  static const assetStories = 'assets/stories.json';
  static const assetDivider = 'assets/divider.png';
  static const assetLocked = 'assets/subscribe.png';
  static const assetLogo = 'assets/fudeo.png';
  static const assetPurchases = 'assets/purchases.png';

  static const maximumStoriesPerDay = 3;

  static const academyUrl = 'https://offertelavoroflutter.notion.site/Fudeo-Academy-1d869c983dd7449dace0fd8baedbe1a9';
}