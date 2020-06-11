import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BlogPostApi extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  BlogPostApi({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  }) : super();

  @override
  List<Object> get props => [userId, id, title, body];
}
