import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fudeo_tales/misc/constants.dart';
import 'package:fudeo_tales/models/story.dart';

class StoryService {
  const StoryService();

  Future<List<Story>> get stories async {
    try {
      final data = await rootBundle.loadString(K.assetStories);
      final jsonResult = jsonDecode(data);

      return (jsonResult as List)
          .map((item) => Story.fromJson(item))
          .toList(growable: false);
    } catch (_) {
      throw Exception('Can\t load stories');
    }
  }
}
