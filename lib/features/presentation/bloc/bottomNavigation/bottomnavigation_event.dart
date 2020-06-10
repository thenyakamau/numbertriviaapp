part of 'bottomnavigation_bloc.dart';

abstract class BottomnavigationEvent extends Equatable {
  const BottomnavigationEvent();
}

class GoToNumberTrivia extends BottomnavigationEvent {
  @override
  List<Object> get props => [];
}

class GoToBlog extends BottomnavigationEvent {
  @override
  List<Object> get props => [];
}
