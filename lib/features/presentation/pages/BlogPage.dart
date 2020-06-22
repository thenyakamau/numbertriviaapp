import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/domain/entities/BlogPostApi.dart';

import '../../../injection_container.dart';
import '../bloc/blogPostApiBloc/blogpostapibloc_bloc.dart';
import '../widgets/widgets.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  BlogpostapiblocBloc bloc;
  @override
  void initState() {
    bloc = sl<BlogpostapiblocBloc>();
    bloc.add(GetBlogPosts());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: BlocProvider<BlogpostapiblocBloc>(
            create: (_) => bloc,
            child: BlocBuilder<BlogpostapiblocBloc, BlogpostapiblocState>(
              builder: (context, state) {
                if (state is BlogpostapiblocInitial) {
                  return Container();
                } else if (state is BlogPostLoadingState) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ShimmerList(),
                  );
                } else if (state is BlogPostLoadedState) {
                  final posts = state.blogPostApi;
                  return PostsListsBuilder(posts: posts);
                } else if (state is BlogPostErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return Container(color: Colors.white);
                }
              },
            ),
          ),
        ),
        AddFloatingButton(),
      ],
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
