import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCase.dart';
import '../entities/NumberTrivia.dart';
import '../repositories/NumberTriviaRepository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository triviaRepository;

  GetRandomNumberTrivia(this.triviaRepository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams noParams) async {
    return await triviaRepository.getRandomNumberTrivia();
  }
}
