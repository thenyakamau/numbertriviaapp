import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/usecases/UseCase.dart';
import '../../../../core/utils/Constants.dart';
import '../../../domain/entities/BlogPostApi.dart';
import '../../../domain/usecases/GetBlogAllPosts.dart';

part 'blogpostapibloc_event.dart';
part 'blogpostapibloc_state.dart';

class BlogpostapiblocBloc
    extends Bloc<BlogpostapiblocEvent, BlogpostapiblocState> {
  final GetAllBlogPosts getAllBlogPosts;

  BlogpostapiblocBloc({@required this.getAllBlogPosts});
  @override
  BlogpostapiblocState get initialState => BlogpostapiblocInitial();

  @override
  Stream<BlogpostapiblocState> mapEventToState(
    BlogpostapiblocEvent event,
  ) async* {
    if (event is GetBlogPosts) {
      yield BlogPostLoadingState();

      final blogPostsEither = await getAllBlogPosts(NoParams());
      yield* blogPostsEither.fold(
        (failure) async* {
          yield BlogPostErrorState(message: _mapFailureToMessage(failure));
        },
        (posts) async* {
          yield BlogPostLoadedState(blogPostApi: posts);
        },
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
