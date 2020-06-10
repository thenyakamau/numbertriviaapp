// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlogPostApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$BlogPostApiService extends BlogPostApiService {
  _$BlogPostApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BlogPostApiService;

  @override
  Future<Response<BlogPostsModel>> getBlogPosts() {
    final $url = '/posts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BlogPostsModel, BlogPostsModel>($request);
  }

  @override
  Future<Response<BlogPostsModel>> getBlogPost(int id) {
    final $url = '/posts/$id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BlogPostsModel, BlogPostsModel>($request);
  }

  @override
  Future<Response<BlogPostsModel>> postBlogPost(Map<String, dynamic> body) {
    final $url = '/posts';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<BlogPostsModel, BlogPostsModel>($request);
  }
}