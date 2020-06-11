import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/errors/Exceptions.dart';
import '../models/BlogPostModel.dart';

abstract class BlogPostLocalDataSource {
  Future<BlogPostsModel> getLastBlogsInstance();
  Future<void> cacheBlogPosts(BlogPostsModel blogPostsModel);
}

const CACHED_BLOG_POSTS = "CACHED_BLOG_POSTS";

class BlogPostLocalDataSorceImpl implements BlogPostLocalDataSource {
  final SharedPreferences sharedPreferences;

  BlogPostLocalDataSorceImpl({@required this.sharedPreferences});
  @override
  Future<void> cacheBlogPosts(BlogPostsModel blogPostsModel) {
    return sharedPreferences.setString(
        CACHED_BLOG_POSTS, json.encode(blogPostsModel));
  }

  @override
  Future<BlogPostsModel> getLastBlogsInstance() {
    final jsonString = sharedPreferences.getString(CACHED_BLOG_POSTS);
    if (jsonString != null) {
      return Future.value(BlogPostsModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
