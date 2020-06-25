import 'package:meta/meta.dart';

import '../../../database/BlogPostsDao.dart';
import '../../../database/NumberTriviaDatabase.dart';
import '../models/BlogPostModel.dart';

abstract class BlogPostLocalDataSource {
  Future<List<BlogPostsModel>> getLastBlogsInstance();
  Future<void> cacheBlogPosts(List<BlogPostsModel> blogPostsModel);
}

class BlogPostLocalDataSorceImpl implements BlogPostLocalDataSource {
  final BlogPostsDao postsDao;

  BlogPostLocalDataSorceImpl({@required this.postsDao});
  @override
  Future<void> cacheBlogPosts(List<BlogPostsModel> blogPostsModel) async {
    await postsDao.deleteAll();
    for (var i = 0; i < blogPostsModel.length; i++) {
      try {
        BlogPostsModel e = blogPostsModel[i];
        await postsDao.insertPost(
          PostsTable(userId: e.userId, id: e.id, title: e.title, body: e.body),
        );
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Future<List<BlogPostsModel>> getLastBlogsInstance() async {
    List<PostsTable> postsObject = await postsDao.getAllPosts();
    List<BlogPostsModel> posts = [];
    for (var i = 0; i < postsObject.length; i++) {
      PostsTable e = postsObject[i];
      posts.add(
        BlogPostsModel(
          userId: e.userId,
          id: e.id,
          title: e.title,
          body: e.body,
        ),
      );
    }
    return posts;
  }
}
