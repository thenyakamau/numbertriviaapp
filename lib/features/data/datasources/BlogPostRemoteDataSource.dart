import 'package:meta/meta.dart';
import 'package:number_trivia/core/errors/Exceptions.dart';

import '../models/BlogPostModel.dart';
import 'BlogPostApiService.dart';

abstract class BlogPostRemoteDataSource {
  Future<List<BlogPostsModel>> getBlogPosts();
}

class BlogPostRemoteDataSourceImpl implements BlogPostRemoteDataSource {
  final BlogPostApiService blogPostApiService;

  BlogPostRemoteDataSourceImpl({@required this.blogPostApiService});
  @override
  Future<List<BlogPostsModel>> getBlogPosts() async {
    final response = await blogPostApiService.getBlogPosts();
    print(response.body);
    if (response.statusCode == 200) {
      List<BlogPostsModel> posts = (response.body as List)
          .map((e) => BlogPostsModel.fromJson(e))
          .toList();
      return posts;
    } else {
      throw ServerException();
    }
  }
}
