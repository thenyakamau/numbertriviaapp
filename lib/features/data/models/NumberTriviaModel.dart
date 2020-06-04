import 'package:number_trivia/features/domain/entities/NumberTrivia.dart';
import 'package:meta/meta.dart';

class NumberTriviaModel extends NumberTrivia {
  final String text;
  final int number;
  final bool found;
  final String type;

  NumberTriviaModel(
      {@required this.text,
      @required this.number,
      @required this.found,
      @required this.type})
      : super(text: text, number: number, found: found, type: type);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
        text: json['text'],
        number: (json['number'] as num).toInt(),
        found: json['found'],
        type: json['type']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['number'] = this.number;
    data['found'] = this.found;
    data['type'] = this.type;
    return data;
  }
}
