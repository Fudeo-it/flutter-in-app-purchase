part of 'dependency_injector.dart';

final List<SingleChildWidget> _providers = [
  Provider<StoryService>(
    create: (_) => const StoryService(),
  ),
];
