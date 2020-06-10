import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'blogpostapibloc_event.dart';
part 'blogpostapibloc_state.dart';

class BlogpostapiblocBloc extends Bloc<BlogpostapiblocEvent, BlogpostapiblocState> {
  @override
  BlogpostapiblocState get initialState => BlogpostapiblocInitial();

  @override
  Stream<BlogpostapiblocState> mapEventToState(
    BlogpostapiblocEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
