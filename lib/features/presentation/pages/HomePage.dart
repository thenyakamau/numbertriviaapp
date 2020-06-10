import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/presentation/widgets/bottom_navbar_widget.dart';

import '../../../injection_container.dart';
import '../bloc/bottomNavigation/bottomnavigation_bloc.dart';
import 'BlogPage.dart';
import 'NumberTriviaPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = sl<BottomnavigationBloc>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Number Trivia"),
        ),
        body: BlocProvider<BottomnavigationBloc>(
          create: (_) => bloc,
          child: SingleChildScrollView(
            child: BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
              builder: (context, state) {
                if (state is BlogState) {
                  return BlogPage();
                } else if (state is NumberTriviaState) {
                  return NumberTriviaPage();
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: BuildBottomNavigationbar(bloc: bloc));
  }
}
