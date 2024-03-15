import 'dart:async';

import 'package:bloc/bloc.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePageDots>(_homePageDots);
  }

  FutureOr<void> _homePageDots(
      HomePageDots event, Emitter<HomePageState> emit) {
    emit(state.copyWith(event.index));
  }
}
