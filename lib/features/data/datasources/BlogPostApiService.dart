import 'package:chopper/chopper.dart';

import '../models/BlogPostModel.dart';

part 'BlogPostApiService.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class BlogPostApiService extends ChopperService {
  @Get()
  Future<Response<BlogPostsModel>> getBlogPosts();

  @Get(path: '/{id}')
  Future<Response<BlogPostsModel>> getBlogPost(@Path('id') int id);

  @Post()
  Future<Response<BlogPostsModel>> postBlogPost(
    @Body() Map<String, dynamic> body,
  );

  static BlogPostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [_$BlogPostApiService()],
      converter: JsonConverter(),
    );
    return _$BlogPostApiService(client);
  }
}
