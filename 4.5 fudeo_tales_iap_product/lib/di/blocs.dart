part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<StoryBloc>(
    create: (context) => StoryBloc(
      storyRepository: context.read(),
    )..fetch(),
  ),
  BlocProvider<NavigationCounterCubit>(
    create: (_) => NavigationCounterCubit(),
  ),
  BlocProvider<ProductBloc>(
    create: (context) => ProductBloc(
      iapRepository: context.read(),
    ),
  ),
];
