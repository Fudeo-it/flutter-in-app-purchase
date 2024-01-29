import 'package:hydrated_bloc/hydrated_bloc.dart';

class SubscriptionsCubit extends HydratedCubit<Set<String>> {
  SubscriptionsCubit() : super(const {});

  void restoreSubscriptions(Set<String> subscriptions) => emit(subscriptions);

  void addSubscriptions(Set<String> subscriptions) {
    final Set<String> prevSubscriptions = Set.from(state);
    prevSubscriptions.addAll(subscriptions);

    emit(prevSubscriptions);
  }

  @override
  Set<String>? fromJson(Map<String, dynamic> json) =>
      (json['subscriptions'] as String).split(',').toSet();

  @override
  Map<String, dynamic>? toJson(Set<String> state) => {
        'subscriptions': state.join(','),
      };
}
