import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:meta/meta.dart';
import 'package:studio_andy_app/entities/post.dart';
import 'package:studio_andy_app/gateways/contentful_gateway.dart';

@immutable
class PostBloc implements Bloc {
  final _postsSubject = BehaviorSubject<List<Post>>();
  final _indexController = StreamController<int>();

  PostBloc() {
    _fetchPosts();
    _indexController.stream.listen(_handleIndex);
  }

  Sink<int> get setIndex => _indexController.sink;

  ValueObservable<List<Post>> get posts => _postsSubject.stream;

  Future<void> _fetchPosts() async {
    var posts = await ContentfulGateway().getPosts();
    _postsSubject.add(posts);
  }

  void _handleIndex(int index) async {
    await _fetchPosts();
  }

  @override
  void dispose() {
    _postsSubject.close();
    _indexController.close();
  }
}
