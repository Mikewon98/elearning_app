import 'dart:async';

import 'package:bloc/bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<TriggerAppEvent>(_triggerAppEvent);
  }

  FutureOr<void> _triggerAppEvent(
      TriggerAppEvent event, Emitter<AppState> emit) {
    emit(AppState(index: event.index));
  }
}
