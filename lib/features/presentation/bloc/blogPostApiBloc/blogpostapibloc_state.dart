part of 'blogpostapibloc_bloc.dart';

abstract class BlogpostapiblocState extends Equatable {
  const BlogpostapiblocState();
}

class BlogpostapiblocInitial extends BlogpostapiblocState {
  @override
  List<Object> get props => [];
}

class BlogPostLoadingState extends BlogpostapiblocState {
  @override
  List<Object> get props => [];
}

class BlogPostLoadedState extends BlogpostapiblocState {
  final List<BlogPostApi> blogPostApi;

  BlogPostLoadedState({@required this.blogPostApi});

  @override
  List<Object> get props => [blogPostApi];
}

class BlogPostErrorState extends BlogpostapiblocState {
  final String message;

  BlogPostErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
