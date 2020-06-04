import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../entities/NumberTrivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
