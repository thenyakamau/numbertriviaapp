import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCase.dart';
import '../entities/BlogPostApi.dart';
import '../repositories/BlogPostRepository.dart';

class GetAllBlogPosts extends UseCase<BlogPostApi, NoParams> {
  final BlogPostRepository repository;

  GetAllBlogPosts({@required this.repository});
  @override
  Future<Either<Failure, BlogPostApi>> call(NoParams noParams) async {
    return await repository.getPosts();
  }
}
