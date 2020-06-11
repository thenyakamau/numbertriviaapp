import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../bloc/bottomNavigation/bottomnavigation_bloc.dart';
import '../widgets/bottom_navbar_widget.dart';
import 'BlogPage.dart';
import 'NumberTriviaPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomnavigationBloc bloc;
  @override
  void initState() {
    bloc = sl<BottomnavigationBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Trivia"),
      ),
      body: BlocProvider<BottomnavigationBloc>(
        create: (_) => bloc,
        child: Container(
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
      bottomNavigationBar: BuildBottomNavigationbar(bloc: bloc),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
