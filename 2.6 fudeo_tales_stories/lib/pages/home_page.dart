import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_tales/blocs/story/story_bloc.dart';
import 'package:fudeo_tales/widgets/story_widget.dart';
import 'package:fudeo_tales/widgets/zig_zag_divider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFC4EBFD),
          title: const Text('STORIE'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(2.0),
            child: Divider(
              height: 0,
              color: Colors.black26,
            ),
          ),
        ),
        body: Container(
          color: const Color(0xFFC4EBFD),
          child: BlocBuilder<StoryBloc, StoryState>(
            builder: (context, state) => switch (state) {
              ErrorStoryState(:final error) => Center(
                  child: Text(error),
                ),
              NoStoryState() => const Center(
                  child: Text('Nessuna storia disponibile'),
                ),
              FetchedStoryState(:final stories) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => StoryWidget(stories[index]),
                  separatorBuilder: (_, __) => const ZigZagDivider(),
                  itemCount: stories.length,
                ),
              _ => const SizedBox.shrink(),
            },
          ),
        ),
      );
}
