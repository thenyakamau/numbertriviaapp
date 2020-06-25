import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/BlogPostApi.dart';

part 'BlogPostModel.g.dart';

@JsonSerializable()
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

  factory BlogPostsModel.fromJson(Map<String, dynamic> json) =>
      _$BlogPostsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogPostsModelToJson(this);
}
