import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_tales/models/story.dart';
import 'package:fudeo_tales/repositories/story_repository.dart';

part 'story_event.dart';

part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryRepository storyRepository;

  StoryBloc({
    required this.storyRepository,
  }) : super(const FetchingStoryState()) {
    on<FetchStoriesEvent>(_onFetch);
  }

  void fetch() => add(const FetchStoriesEvent());

  void _onFetch(FetchStoriesEvent event, Emitter<StoryState> emit) async {
    emit(const FetchingStoryState());

    try {
      final stories = await storyRepository.stories;

      emit(stories.isNotEmpty
          ? FetchedStoryState(stories)
          : const NoStoryState());
    } catch (error) {
      emit(ErrorStoryState(error.toString()));
    }
  }
}
