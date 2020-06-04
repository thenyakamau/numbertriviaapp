part of 'numbertrivia_bloc.dart';

abstract class NumbertriviaState extends Equatable {
  const NumbertriviaState();
}

class NumbertriviaInitial extends NumbertriviaState {
  @override
  List<Object> get props => [];
}

class NumbertriviaLoading extends NumbertriviaState {
  @override
  List<Object> get props => [];
}

class NumbertriviaLoaded extends NumbertriviaState {
  final NumberTrivia numberTrivia;

  NumbertriviaLoaded({@required this.numberTrivia});

  @override
  List<Object> get props => [numberTrivia];
}

class NumbertriviaError extends NumbertriviaState {
  final String message;

  NumbertriviaError({@required this.message});

  @override
  List<Object> get props => [message];
}
