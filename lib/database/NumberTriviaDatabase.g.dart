// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NumberTriviaDatabase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PostsTable extends DataClass implements Insertable<PostsTable> {
  final int userId;
  final int id;
  final String title;
  final String body;
  PostsTable(
      {@required this.userId,
      @required this.id,
      @required this.title,
      @required this.body});
  factory PostsTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return PostsTable(
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      body: stringType.mapFromDatabaseResponse(data['${effectivePrefix}body']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    return map;
  }

  BlogPostsTableCompanion toCompanion(bool nullToAbsent) {
    return BlogPostsTableCompanion(
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
    );
  }

  factory PostsTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PostsTable(
      userId: serializer.fromJson<int>(json['userId']),
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
    };
  }

  PostsTable copyWith({int userId, int id, String title, String body}) =>
      PostsTable(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );
  @override
  String toString() {
    return (StringBuffer('PostsTable(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(userId.hashCode,
      $mrjc(id.hashCode, $mrjc(title.hashCode, body.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PostsTable &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body);
}

class BlogPostsTableCompanion extends UpdateCompanion<PostsTable> {
  final Value<int> userId;
  final Value<int> id;
  final Value<String> title;
  final Value<String> body;
  const BlogPostsTableCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
  });
  BlogPostsTableCompanion.insert({
    @required int userId,
    this.id = const Value.absent(),
    @required String title,
    @required String body,
  })  : userId = Value(userId),
        title = Value(title),
        body = Value(body);
  static Insertable<PostsTable> custom({
    Expression<int> userId,
    Expression<int> id,
    Expression<String> title,
    Expression<String> body,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
    });
  }

  BlogPostsTableCompanion copyWith(
      {Value<int> userId,
      Value<int> id,
      Value<String> title,
      Value<String> body}) {
    return BlogPostsTableCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    return map;
  }
}

class $BlogPostsTableTable extends BlogPostsTable
    with TableInfo<$BlogPostsTableTable, PostsTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $BlogPostsTableTable(this._db, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  GeneratedTextColumn _body;
  @override
  GeneratedTextColumn get body => _body ??= _constructBody();
  GeneratedTextColumn _constructBody() {
    return GeneratedTextColumn(
      'body',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [userId, id, title, body];
  @override
  $BlogPostsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'blog_posts_table';
  @override
  final String actualTableName = 'blog_posts_table';
  @override
  VerificationContext validateIntegrity(Insertable<PostsTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body'], _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostsTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PostsTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BlogPostsTableTable createAlias(String alias) {
    return $BlogPostsTableTable(_db, alias);
  }
}

abstract class _$NumberTriviaDataBase extends GeneratedDatabase {
  _$NumberTriviaDataBase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $BlogPostsTableTable _blogPostsTable;
  $BlogPostsTableTable get blogPostsTable =>
      _blogPostsTable ??= $BlogPostsTableTable(this);
  BlogPostsDao _blogPostsDao;
  BlogPostsDao get blogPostsDao =>
      _blogPostsDao ??= BlogPostsDao(this as NumberTriviaDataBase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [blogPostsTable];
}
