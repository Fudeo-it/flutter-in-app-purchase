import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_tales/blocs/story/story_bloc.dart';
import 'package:fudeo_tales/cubits/navigation_counter/navigation_counter_cubit.dart';
import 'package:fudeo_tales/cubits/subscriptions_cubit.dart';
import 'package:fudeo_tales/misc/constants.dart';
import 'package:fudeo_tales/pages/locked_page.dart';
import 'package:fudeo_tales/pages/story_page.dart';
import 'package:fudeo_tales/widgets/fudeo_ad.dart';
import 'package:fudeo_tales/widgets/story_widget.dart';
import 'package:fudeo_tales/widgets/zig_zag_divider.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
          child: Column(
            children: [
              Expanded(
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
                        itemBuilder: (context, index) {
                          final story = stories[index];

                          return StoryWidget(
                            story,
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) {
                                  final locked = context
                                      .read<NavigationCounterCubit>()
                                      .state
                                      .locked;

                                  if (locked) {
                                    return const LockedPage();
                                  }

                                  return StoryPage(story);
                                },
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const ZigZagDivider(),
                        itemCount: stories.length,
                      ),
                    _ => const SizedBox.shrink(),
                  },
                ),
              ),
              BlocBuilder<SubscriptionsCubit, Set<String>>(
                builder: (context, subscriptions) {
                  if (subscriptions.contains(K.oneTimeSubscriptionProductId)) {
                    return const SizedBox.shrink();
                  }

                  return FudeoAd(
                    onPressed: () => launchUrlString(
                      K.academyUrl,
                      mode: LaunchMode.externalNonBrowserApplication,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
}
