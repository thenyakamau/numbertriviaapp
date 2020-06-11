import 'package:number_trivia/features/domain/entities/BlogPostApi.dart';
import 'package:meta/meta.dart';

class BlogPostsModel extends BlogPostApi {
  final int userId;
  final int id;
  final String title;
  final String body;

  BlogPostsModel({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  }) : super(userId: userId, id: id, title: title, body: body);

  factory BlogPostsModel.fromJson(Map<String, dynamic> json) {
    return BlogPostsModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
