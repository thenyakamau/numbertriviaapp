import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NumberTrivia extends Equatable {
  final String text;
  final int number;
  final bool found;
  final String type;

  NumberTrivia(
      {@required this.text,
      @required this.number,
      @required this.found,
      @required this.type})
      : super();

  @override
  List<Object> get props {
    return [text, number, found, type];
  }
}
