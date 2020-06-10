import 'package:flutter/material.dart';

import '../bloc/bottomNavigation/bottomnavigation_bloc.dart';

class BuildBottomNavigationbar extends StatefulWidget {
  final BottomnavigationBloc bloc;
  const BuildBottomNavigationbar({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  @override
  _BottomNavigationbarState createState() => _BottomNavigationbarState(bloc);
}

class _BottomNavigationbarState extends State<BuildBottomNavigationbar> {
  int _selectedIndex = 0;
  final BottomnavigationBloc bloc;

  _BottomNavigationbarState(this.bloc);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).accentColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.red,
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.white))), //
      child: BottomNavigationBar(
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('NumberTrivia'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('BlogList'),
          ),
        ],
        showUnselectedLabels: true,
        selectedItemColor: Color(0xFFFFC61F),
        onTap: (index) => _onPress(index),
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onPress(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        bloc.add(GoToNumberTrivia());
        break;
      case 1:
        bloc.add(GoToBlog());
        break;
    }
  }
}
