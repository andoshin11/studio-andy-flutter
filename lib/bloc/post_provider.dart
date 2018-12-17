import 'package:bloc_provider/bloc_provider.dart';
import 'package:meta/meta.dart';
import 'package:flutter/widgets.dart';
import 'package:studio_andy_app/bloc/post_bloc.dart';

class PostProvider extends BlocProvider<PostBloc> {
  PostProvider({@required Widget child})
      : super(creator: (context, _bag) => PostBloc(), child: child);

  static PostBloc of(BuildContext context) => BlocProvider.of(context);
}
