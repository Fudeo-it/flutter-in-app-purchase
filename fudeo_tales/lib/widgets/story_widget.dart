import 'package:flutter/material.dart';
import 'package:fudeo_tales/models/story.dart';

class StoryWidget extends StatelessWidget {
  final Story story;
  final GestureTapCallback? onTap;

  const StoryWidget(
    this.story, {
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 12.0,
                        top: 12.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 12.0,
                        bottom: 12.0,
                      ),
                      child: Image.asset(
                        'assets/stories/${story.picture}',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  story.title,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
