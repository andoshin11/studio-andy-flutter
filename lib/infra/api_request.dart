import 'package:studio_andy_app/infra/api_client.dart';
import 'package:meta/meta.dart';

typedef T ResponseBuilder<T>(Map<String, dynamic> data);

class APIRequest {
  APIRequest(
      {@required this.path, @required this.method, this.params, this.baseURL});

  final String path;
  final HTTPMethod method;
  final Map<String, String> params;
  final String baseURL;
}
