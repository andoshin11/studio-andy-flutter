import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:studio_andy_app/entities/post.dart';

class PostCard extends StatelessWidget {
  PostCard({@required this.post});

  final Post post;

  Widget _buildDate() {
    Widget text;

    if (post.publishedAt.isNotEmpty) {
      final publishedAt = DateTime.parse(post.publishedAt).toLocal();
      text = new Text(
        new DateFormat('MMM d, yyy').format(publishedAt),
        style: TextStyle(fontSize: 14.0),
      );
    } else {
      text = new Text('');
    }

    return new Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: text,
    );
  }

  Widget _buildTitle() {
    return new Container(
      child: new Text(post.title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTagList() {
    List<Widget> _tagList = [];

    for (var i = 0; i < post.tags.length; i++) {
      if (i != 0) {
        // push separator
        _tagList.add(new Container(
          margin: EdgeInsets.only(right: 8.0),
          child: new Text(
            '/',
            style: TextStyle(fontSize: 14.0),
          ),
        ));
      }
      _tagList.add(new CupertinoButton(
        child: new Text(post.tags[i], style: TextStyle(fontSize: 14.0)),
        onPressed: () {
          print('${post.tags[i]} is pressed');
        },
        padding: EdgeInsets.only(top: 0, right: 7.0, bottom: 0, left: 0),
      ));
    }

    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: _tagList,
      ),
    );
  }

  Widget _buildBody() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[_buildDate(), _buildTitle(), _buildTagList()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Theme.of(context).primaryColor,
      elevation: 1.2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      margin: EdgeInsets.only(bottom: 40.0, left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[_buildBody()],
      ),
    );
  }
}
