import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../../../core/errors/Failures.dart';
import '../../../core/network/NetworkInfo.dart';
import '../../domain/entities/BlogPostApi.dart';
import '../../domain/repositories/BlogPostRepository.dart';
import '../datasources/BlogPostLocalDataSource.dart';
import '../datasources/BlogPostRemoteDataSource.dart';

class BlogPostRepositoryImpl extends BlogPostRepository {
  final BlogPostRemoteDataSource remoteDataSource;
  final BlogPostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  BlogPostRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, BlogPostApi>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBlog = await remoteDataSource.getBlogPosts();
        localDataSource.cacheBlogPosts(remoteBlog);
        return Right(remoteBlog);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localBlog = await localDataSource.getLastBlogsInstance();
        return Right(localBlog);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
