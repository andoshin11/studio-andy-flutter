import 'package:flutter/material.dart';
import 'package:studio_andy_app/bloc/post_provider.dart';
import 'package:studio_andy_app/ui/post_card.dart';
import 'package:studio_andy_app/entities/post.dart';

class IndexPage extends StatelessWidget {
  IndexPage();

  @override
  Widget build(BuildContext context) {
    final postBloc = PostProvider.of(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[200],
      body: new Column(
        children: <Widget>[
          new Expanded(
              child: StreamBuilder(
                  stream: postBloc.posts,
                  builder: (context, snapshot) {
                    if (snapshot.data?.isEmpty ?? true) {
                      return Center(child: Text('Empty'));
                    }

                    return ListView(
                        children: snapshot.data
                            .map<Widget>((Post item) => new PostCard(
                                  post: item,
                                  headerImage: postBloc.assets.value.firstWhere(
                                      (asset) =>
                                          asset.id ==
                                          item.headerImageLight.sys.id),
                                ))
                            .toList());
                  }))
        ],
      ),
    );
  }
}
