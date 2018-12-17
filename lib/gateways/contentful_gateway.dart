import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:studio_andy_app/infra/api_client.dart';
import 'package:studio_andy_app/infra/api_request.dart';
import 'package:studio_andy_app/entities/post.dart';

class ContentfulGateway {
  Future<List<Post>> getPosts() async {
    var res = await APIClient.request(new APIRequest(
        path:
            '/spaces/${DotEnv().env['CTF_SPACE_ID']}/environments/master/entries',
        params: {'access_token': DotEnv().env['CTF_CDA_ACCESS_TOKEN']},
        method: HTTPMethod.GET));

    var posts =
        res['items'].map((item) => Post.fromJson(item['fields'])).cast<Post>();

    return posts.toList();
  }
}
