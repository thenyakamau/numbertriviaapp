part of 'blogpostapibloc_bloc.dart';

abstract class BlogpostapiblocEvent extends Equatable {
  const BlogpostapiblocEvent();
}

class GetBlogPosts extends BlogpostapiblocEvent {
  @override
  List<Object> get props => [];
}
