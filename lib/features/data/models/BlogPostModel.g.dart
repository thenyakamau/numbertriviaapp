// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlogPostModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogPostsModel _$BlogPostsModelFromJson(Map<String, dynamic> json) {
  return BlogPostsModel(
    userId: json['userId'] as int,
    id: json['id'] as int,
    title: json['title'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$BlogPostsModelToJson(BlogPostsModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
