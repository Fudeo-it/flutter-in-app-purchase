part of 'navigation_counter_cubit.dart';

class NavigationCounterState extends Equatable {
  final DateTime dateTime;
  final int counter;

  const NavigationCounterState({
    required this.dateTime,
    required this.counter,
  });

  bool get locked => counter > K.maximumStoriesPerDay;

  @override
  List<Object> get props => [
    dateTime,
    counter,
  ];
}
