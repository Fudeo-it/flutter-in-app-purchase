part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  RepositoryProvider<StoryRepository>(
    create: (context) => StoryRepository(
      storyService: context.read(),
    ),
  ),
];
