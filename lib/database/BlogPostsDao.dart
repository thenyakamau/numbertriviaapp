import 'package:moor_flutter/moor_flutter.dart';

import 'BlogPostsTable.dart';
import 'NumberTriviaDatabase.dart';

part 'BlogPostsDao.g.dart';

@UseDao(tables: [BlogPostsTable])
class BlogPostsDao extends DatabaseAccessor<NumberTriviaDataBase>
    with _$BlogPostsDaoMixin {
  BlogPostsDao(NumberTriviaDataBase db) : super(db);

  Future<List<PostsTable>> getAllPosts() => select(blogPostsTable).get();

  Future<List<PostsTable>> getSinglePost(int id) {
    return (select(blogPostsTable)..where((t) => t.id.equals(id))).get();
  }

  Future insertPost(PostsTable postsTable) =>
      into(blogPostsTable).insert(postsTable);

  Future deleteAll() => delete(blogPostsTable).go();
}
