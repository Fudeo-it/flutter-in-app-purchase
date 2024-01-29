import 'package:equatable/equatable.dart';
import 'package:fudeo_tales/extensions/date_time_extensions.dart';
import 'package:fudeo_tales/misc/constants.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'navigation_counter_state.dart';

class NavigationCounterCubit extends HydratedCubit<NavigationCounterState> {
  NavigationCounterCubit()
      : super(
          NavigationCounterState(
            dateTime: DateTime.now(),
            counter: 0,
          ),
        );

  void increment() {
    final dateTime = state.dateTime;
    final counter = state.counter;
    final now = DateTime.now();

    if (now.isSameDay(dateTime)) {
      emit(
        NavigationCounterState(
          dateTime: now,
          counter: counter + 1,
        ),
      );
    } else {
      emit(
        NavigationCounterState(
          dateTime: now,
          counter: 1,
        ),
      );
    }
  }

  void reset() {
    emit(
      NavigationCounterState(
        dateTime: DateTime.now(),
        counter: 0,
      ),
    );
  }

  @override
  NavigationCounterState? fromJson(Map<String, dynamic> json) =>
      NavigationCounterState(
        dateTime: DateTime.parse(json['dateTime'] as String),
        counter: json['counter'] as int,
      );

  @override
  Map<String, dynamic>? toJson(NavigationCounterState state) => {
        'dateTime': state.dateTime.toIso8601String(),
        'counter': state.counter,
      };
}
