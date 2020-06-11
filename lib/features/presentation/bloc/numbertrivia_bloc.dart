import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCase.dart';
import '../../../core/utils/Constants.dart';
import '../../../core/utils/InputConverter.dart';
import '../../domain/entities/NumberTrivia.dart';
import '../../domain/usecases/GetConcreteNumberTrivia.dart';
import '../../domain/usecases/GetRandomNumberTrivia.dart';

part 'numbertrivia_event.dart';
part 'numbertrivia_state.dart';

class NumbertriviaBloc extends Bloc<NumbertriviaEvent, NumbertriviaState> {
  final GetConcreteNumberTrivia concreteNumberTrivia;
  final GetRandomNumberTrivia randomNumberTrivia;
  final InputConverter inputConverter;

  NumbertriviaBloc({
    @required this.concreteNumberTrivia,
    @required this.randomNumberTrivia,
    @required this.inputConverter,
  })  : assert(concreteNumberTrivia != null),
        assert(randomNumberTrivia != null),
        assert(inputConverter != null);

  @override
  NumbertriviaState get initialState => NumbertriviaInitial();

  @override
  Stream<NumbertriviaState> mapEventToState(
    NumbertriviaEvent event,
  ) async* {
    if (event is GetTriviaForConcreteNumber) {
      final inputEither =
          inputConverter.stringToUnsignedInteger(event.numberString);
      yield* inputEither.fold((failure) async* {
        yield (NumbertriviaError(message: INPUT_FAILURE_MESSAGE));
      }, (integer) async* {
        yield NumbertriviaLoading();
        final triviaEither =
            await concreteNumberTrivia(Params(number: integer));
        yield* _getTriviaOrFailure(triviaEither);
      });
    } else if (event is GetTriviaForRandomNumber) {
      yield NumbertriviaLoading();
      final triviaEither = await randomNumberTrivia(NoParams());
      yield* _getTriviaOrFailure(triviaEither);
    }
  }

  Stream<NumbertriviaState> _getTriviaOrFailure(
      Either<Failure, NumberTrivia> triviaEither) async* {
    yield triviaEither.fold(
      (failure) => NumbertriviaError(message: _mapFailureToMessage(failure)),
      (trivia) => NumbertriviaLoaded(numberTrivia: trivia),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
