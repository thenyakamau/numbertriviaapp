import 'package:chopper/chopper.dart';

part 'BlogPostApiService.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class BlogPostApiService extends ChopperService {
  @Get()
  Future<Response> getBlogPosts();

  @Get(path: '/{id}')
  Future<Response> getBlogPost(@Path('id') int id);

  @Post()
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> postBlogPost(
    @Body() Map<String, dynamic> body,
  );

  static BlogPostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [_$BlogPostApiService()],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'Cache-Control': 'no-cache'}),
        HttpLoggingInterceptor()
      ],
    );
    return _$BlogPostApiService(client);
  }
}
