part of 'story_bloc.dart';

abstract class StoryState extends Equatable {
  const StoryState();

  @override
  List<Object> get props => [];
}

class FetchingStoryState extends StoryState {
  const FetchingStoryState();
}

class FetchedStoryState extends StoryState {
  final List<Story> stories;

  const FetchedStoryState(this.stories);

  @override
  List<Object> get props => [stories];
}

class NoStoryState extends StoryState {
  const NoStoryState();
}

class ErrorStoryState extends StoryState {
  final String error;

  const ErrorStoryState(this.error);

  @override
  List<Object> get props => [error];
}