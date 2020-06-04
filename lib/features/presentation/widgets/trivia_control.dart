import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/numbertrivia_bloc.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    Key key,
  }) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  String inputString;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Input a number....",
          ),
          onChanged: (value) {
            inputString = value;
          },
          controller: controller,
          onSubmitted: (value) => _dispatchConcrete(),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
                child: RaisedButton(
              onPressed: _dispatchConcrete,
              color: Theme.of(context).accentColor,
              child: Text("Search"),
              textTheme: ButtonTextTheme.primary,
            )),
            SizedBox(width: 10),
            Expanded(
                child: RaisedButton(
              onPressed: _dispatchRandom,
              child: Text("Get Random Trivia"),
            ))
          ],
        )
      ],
    );
  }

  void _dispatchConcrete() {
    controller.clear();
    BlocProvider.of<NumbertriviaBloc>(context)
        .add(GetTriviaForConcreteNumber(inputString));
  }

  void _dispatchRandom() {
    controller.clear();
    BlocProvider.of<NumbertriviaBloc>(context).add(GetTriviaForRandomNumber());
  }
}
