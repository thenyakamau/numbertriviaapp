import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_trivia/features/domain/entities/BlogPostApi.dart';
import 'package:number_trivia/features/presentation/pages/ViewPostsPage.dart';

import '../../features/presentation/pages/HomePage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => HomePage());
      case '/view_posts':
        if (args is BlogPostApi) {
          return CupertinoPageRoute(builder: (_) => ViewPostsPage(post: args));
        }
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
