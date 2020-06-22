import 'package:flutter/material.dart';

import '../../domain/entities/BlogPostApi.dart';

class PostsListsBuilder extends StatelessWidget {
  const PostsListsBuilder({
    Key key,
    @required this.posts,
  }) : super(key: key);

  final List<BlogPostApi> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          child: Column(
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                posts[index].body,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
