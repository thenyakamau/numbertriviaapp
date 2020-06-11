import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../entities/BlogPostApi.dart';

abstract class BlogPostRepository {
  Future<Either<Failure, BlogPostApi>> getPosts();
}
