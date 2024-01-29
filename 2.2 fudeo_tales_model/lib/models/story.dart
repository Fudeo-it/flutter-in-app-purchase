import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final String title;
  final String body;
  final String picture;

  const Story({
    required this.title,
    required this.body,
    required this.picture,
  });

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    title: json['title'],
    body: json['body'],
    picture: json['picture'],
  );

  @override
  List<Object?> get props => [
    title,
    body,
    picture,
  ];
}
