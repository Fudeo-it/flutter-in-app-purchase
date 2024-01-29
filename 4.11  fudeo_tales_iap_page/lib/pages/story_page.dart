import 'package:flutter/material.dart';
import 'package:fudeo_tales/models/story.dart';

class StoryPage extends StatelessWidget {
  final Story story;

  const StoryPage(this.story, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFCFFFDC),
          title: const Text('LEGGI'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(2.0),
            child: Divider(
              height: 0,
              color: Colors.black26,
            ),
          ),
        ),
        body: Container(
          color: const Color(0xFFCFFFDC),
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                story.title,
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.asset(
                  'assets/stories/${story.picture}',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                story.body,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                  height: 1.75,
                ),
              ),
            ],
          ),
        ),
      );
}
