import 'package:flutter/material.dart';
import 'package:fudeo_tales/cubits/navigation_counter/navigation_counter_cubit.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  final NavigationCounterCubit navigationCounterCubit;

  MyRouteObserver({required this.navigationCounterCubit});

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    if (route is PageRoute) {
      navigationCounterCubit.increment();
    }
  }

}