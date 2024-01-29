import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_tales/blocs/product/product_bloc.dart';
import 'package:fudeo_tales/blocs/purchase/purchase_bloc.dart';
import 'package:fudeo_tales/blocs/story/story_bloc.dart';
import 'package:fudeo_tales/cubits/available_purchase/available_purchase_cubit.dart';
import 'package:fudeo_tales/cubits/navigation_counter/navigation_counter_cubit.dart';
import 'package:fudeo_tales/cubits/subscriptions_cubit.dart';
import 'package:fudeo_tales/repositories/in_app_purchase_repository.dart';
import 'package:fudeo_tales/repositories/story_repository.dart';
import 'package:fudeo_tales/services/story_service.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:pine/pine.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

part 'blocs.dart';

part 'providers.dart';

part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
        blocs: _blocs,
        repositories: _repositories,
        providers: _providers,
        child: child,
      );
}
