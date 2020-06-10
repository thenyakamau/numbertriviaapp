import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottomnavigation_event.dart';
part 'bottomnavigation_state.dart';

class BottomnavigationBloc
    extends Bloc<BottomnavigationEvent, BottomnavigationState> {
  @override
  BottomnavigationState get initialState => NumberTriviaState();

  @override
  Stream<BottomnavigationState> mapEventToState(
    BottomnavigationEvent event,
  ) async* {
    if (event is GoToNumberTrivia) {
      yield NumberTriviaState();
    } else if (event is GoToBlog) {
      yield BlogState();
    }
  }
}
