import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("PostsTable")
class BlogPostsTable extends Table {
  IntColumn get userId => integer()();
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get body => text()();

  @override
  Set<Column> get primaryKey => {id};
}
