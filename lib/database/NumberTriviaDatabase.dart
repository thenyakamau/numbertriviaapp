import 'package:moor_flutter/moor_flutter.dart';

import 'BlogPostsDao.dart';
import 'BlogPostsTable.dart';

part 'NumberTriviaDatabase.g.dart';

@UseMoor(tables: [BlogPostsTable], daos: [BlogPostsDao])
class NumberTriviaDataBase extends _$NumberTriviaDataBase {
  NumberTriviaDataBase()
      : super(
          (FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: true,
          )),
        );

  @override
  int get schemaVersion => 1;
}
