part of 'story_bloc.dart';

abstract class StoryEvent extends Equatable {
  const StoryEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchStoriesEvent extends StoryEvent  {
  const FetchStoriesEvent();
}