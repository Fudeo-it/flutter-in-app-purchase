import 'package:flutter/material.dart';
import 'package:fudeo_tales/cubits/navigation_counter/navigation_counter_cubit.dart';
import 'package:fudeo_tales/cubits/subscriptions_cubit.dart';
import 'package:fudeo_tales/misc/constants.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  final SubscriptionsCubit subscriptionsCubit;
  final NavigationCounterCubit navigationCounterCubit;

  MyRouteObserver({
    required this.subscriptionsCubit,
    required this.navigationCounterCubit,
  });

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    final unlimited =
        subscriptionsCubit.state.contains(K.monthlySubscriptionProductId);

    if (!unlimited && route is PageRoute) {
      navigationCounterCubit.increment();
    }
  }
}
