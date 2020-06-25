import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Future<void> refreshPosts() async {
    return bloc.add(GetBlogPosts());
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
                  return SingleChildScrollView(
                    child: RefreshIndicator(
                      onRefresh: () => refreshPosts(),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Pull to refresh",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: double.infinity,
                            child: PostsListsBuilder(posts: posts),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is BlogPostErrorState) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Text(state.message),
                        SizedBox(height: 10),
                        RaisedButton(
                          onPressed: () => refreshPosts(),
                          color: Theme.of(context).accentColor,
                          child: Text("Refresh"),
                        )
                      ],
                    ),
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
