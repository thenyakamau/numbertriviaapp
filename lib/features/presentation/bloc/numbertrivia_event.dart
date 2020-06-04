part of 'numbertrivia_bloc.dart';

abstract class NumbertriviaEvent extends Equatable {
  const NumbertriviaEvent();
}

class GetTriviaForConcreteNumber extends NumbertriviaEvent {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString);

  @override
  List<Object> get props {
    return [numberString];
  }
}

class GetTriviaForRandomNumber extends NumbertriviaEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
