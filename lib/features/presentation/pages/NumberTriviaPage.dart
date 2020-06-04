import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../bloc/numbertrivia_bloc.dart';
import '../widgets/widgets.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Trivia"),
      ),
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }

  BlocProvider<NumbertriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumbertriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              //Top half
              BlocBuilder<NumbertriviaBloc, NumbertriviaState>(
                builder: (context, state) {
                  if (state is NumbertriviaInitial) {
                    return MessageDisplay(message: "Start searching!");
                  } else if (state is NumbertriviaLoading) {
                    return LoadingWidget();
                  } else if (state is NumbertriviaLoaded) {
                    return TriviaDisplay(numberTrivia: state.numberTrivia);
                  } else if (state is NumbertriviaError) {
                    return MessageDisplay(message: state.message);
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              // Bottom Half
              TriviaControls()
            ],
          ),
        ),
      ),
    );
  }
}
