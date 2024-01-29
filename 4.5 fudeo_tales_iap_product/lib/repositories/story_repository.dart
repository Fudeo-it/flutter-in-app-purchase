import 'package:fudeo_tales/models/story.dart';
import 'package:fudeo_tales/services/story_service.dart';

class StoryRepository {
  final StoryService storyService;

  const StoryRepository({required this.storyService});

  Future<List<Story>> get stories async {
    try {
      return await storyService.stories;
    } catch (error) {
      // Log the errors

      rethrow;
    }
  }
}