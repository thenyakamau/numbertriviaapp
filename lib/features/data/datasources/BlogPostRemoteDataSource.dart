import 'package:meta/meta.dart';
import 'package:number_trivia/core/errors/Exceptions.dart';

import '../models/BlogPostModel.dart';
import 'BlogPostApiService.dart';

abstract class BlogPostRemoteDataSource {
  Future<BlogPostsModel> getBlogPosts();
}

class BlogPostRemoteDataSourceImpl implements BlogPostRemoteDataSource {
  final BlogPostApiService blogPostApiService;

  BlogPostRemoteDataSourceImpl({@required this.blogPostApiService});
  @override
  Future<BlogPostsModel> getBlogPosts() async {
    final response = await blogPostApiService.getBlogPosts();
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException();
    }
  }
}
